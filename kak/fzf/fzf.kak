# ╭─────────────╥───────────────────╮
# │ Author:     ║ Plugin:           │
# │ Andrey Orst ║ fzf.kak           │
# ╞═════════════╩═══════════════════╡
# │ This plugin implements fzf      │
# │ mode for Kakoune. This mode     │
# │ adds several mappings to invoke │
# │ different fzf commands.         │
# ╰─────────────────────────────────╯

define-command -docstring "Enter fzf-mode.
fzf-mode contains mnemonic key bindings for every fzf.kak command

Best used with mapping like:
    map global normal '<some key>' ': fzf-mode<ret>'
" \
fzf-mode %{ require-module fzf; evaluate-commands 'enter-user-mode fzf' }

provide-module fzf %§

declare-option -docstring "height of fzf tmux split in screen lines or percents.
Default value: 25%%" \
str fzf_tmux_height '25%'

declare-option -docstring 'command to use to create new window when not using tmux.

Default value: terminal kak -c %val{session} -e "%arg{@}"' \
str fzf_terminal_command 'terminal kak -c %val{session} -e "%arg{@}"'

declare-option -docstring "use main selection as default query for fzf if the selection is longer than 1 char." \
bool fzf_use_main_selection true

declare-option -docstring "Default options for fzf." \
str fzf_default_opts ''

try %{ declare-user-mode fzf }

define-command -hidden -docstring "wrapper command to create new terminal" \
fzf-window -params .. %{ evaluate-commands %sh{
    if [ -n "$kak_client_env_TMUX" ]; then
        printf "%s\n" 'tmux-terminal-window kak -c %val{session} -e "%arg{@}"'
    else
        printf "%s\n" "$kak_opt_fzf_terminal_command"
    fi
}}

define-command -docstring \
"fzf <switches>: generic fzf command. This command can be used to create new fzf wrappers for various Kakoune or external features.

Switches:
    -kak-cmd <command>: A Kakoune cmd that is applied to fzf resulting value
    -multiple-cmd <command>: A Kakoune cmd that is applied all multiple selected files but the first one
    -items-cmd <items command>: A command that is used as a pipe to provide list of values to fzf
    -fzf-args <args>: Additional flags for fzf program
    -filter <commands>: A pipe which will be applied to result provided by fzf
    -post-action <commands>: Extra commands that are preformed after `-kak-cmd' command" \
-shell-script-completion %{
    printf "%s\n" "-kak-cmd
-multiple-cmd
-items-cmd
-fzf-args
-filter
-post-action"
} \
fzf -params .. %{ evaluate-commands %sh{
    [ "${kak_opt_fzf_use_main_selection}" = "true" ] && \
    [ $(printf "%s" "${kak_selection}" | wc -m) -gt 1 ] && \
    default_query="-i -q ${kak_selection}"

    while [ $# -gt 0 ]; do
        case $1 in
            (-kak-cmd)      shift; kakoune_cmd="$1"  ;;
            (-fzf-args)     shift; fzf_args="$1"     ;;
            (-items-cmd)    shift; items_cmd="$1 |"  ;;
            (-filter)       shift; filter="| $1"     ;;
            (-multiple-cmd) shift; multiple_cmd="$1" ;;
            (-post-action)  shift; post_action="$1"  ;;
        esac
        shift
    done

    fzf_tmp=$(mktemp -d ${TMPDIR:-/tmp}/fzf.kak.XXXXXX)
    fzfcmd="${fzf_tmp}/fzfcmd"
    result="${fzf_tmp}/result"

    (
        shell_path="$(command -v sh)"
        if [ -n "${shell_path}" ]; then
            # portable shebang
            printf "%s\n" "#!${shell_path}"
            printf "%s\n" "SHELL=${shell_path}"
        fi
        # compose entire fzf command with all args into single file which will be executed later
        printf "%s\n" "export FZF_DEFAULT_OPTS=\"$kak_opt_fzf_default_opts\""
        printf "%s\n" "cd \"${PWD}\" && ${items_cmd} fzf ${default_query} ${fzf_args} ${filter} > ${result}"
        printf "%s\n" "rm ${fzfcmd}"
    ) >> ${fzfcmd}
    chmod 755 ${fzfcmd}

    if [ -n "${kak_client_env_TMUX}" ]; then
        # set default height if not set already
        [ -z "${tmux_height}" ] && tmux_height=${kak_opt_fzf_tmux_height}
        # if height contains `%' then `-p' will be used
        [ -n "${tmux_height%%*%}" ] && measure="-l" || measure="-p"

        cmd="nop %sh{ command tmux split-window -Zv -l 50% '${fzfcmd}' < /dev/null > /dev/null 2>&1 }"
    else
        cmd="${kak_opt_fzf_terminal_command%% *} %{${fzfcmd}}"
    fi

    printf "%s\n" "${cmd}"

    # main loop
    (   while [ -e ${fzfcmd} ]; do sleep 0.1; done
        if [ -s ${result} ]; then
            (
                while read -r line; do
                    line=$(printf "%s\n" "${line}" | sed "s/@/@@/g;s/&/&&/g")
                    kakoune_cmd=$(printf "%s\n" "${kakoune_cmd}" | sed "s/&/&&/g")
                    printf "%s\n" "evaluate-commands -client ${kak_client} ${wincmd} %&${kakoune_cmd} %@${line}@&"
                done

                if [ -n "${post_action}" ]; then
                    post_action=$(printf "%s\n" "${post_action}" | sed "s/&/&&/g")
                    printf "%s\n" "evaluate-commands -client ${kak_client} %&${post_action}&"
                fi
            ) < ${result} | kak -p ${kak_session}
        fi
        rm -rf ${fzf_tmp}
    ) > /dev/null 2>&1 < /dev/null &
}}

§
