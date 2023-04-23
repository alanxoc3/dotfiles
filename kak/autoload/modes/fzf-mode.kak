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
        printf "%s\n" "cd \"${PWD}\" && ${items_cmd} fzf ${default_query} ${fzf_args} ${filter} > ${result}"
        printf "%s\n" "rm ${fzfcmd}"
    ) >> ${fzfcmd}
    chmod 755 ${fzfcmd}

    cmd="nop %sh{ command tmux split-window -Zv -l 50% '${fzfcmd}' < /dev/null > /dev/null 2>&1 }"

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

define-command -hidden fzf-grep %{ evaluate-commands %sh{
    grep_cmd="rg --line-number --no-column --no-heading --color=ansi '' 2>/dev/null"

    fzf_args=" \
        --delimiter : \
        --nth 3.. \
        --no-mouse \
        --preview 'fzf_bat_preview {1} {2}' \
        --preview-window up:50% \
        --no-mouse \
        --ansi \
        --no-hscroll \
    "

    printf "fzf %s %s %s %s\n" \
        "-kak-cmd %{evaluate-commands}" \
        "-fzf-args %{$fzf_args}" \
        "-items-cmd %{$grep_cmd}" \
        "-filter %{sed -E 's/([^:]+):([^:]+):.*/edit -existing \1; execute-keys \2gvcx/'}"
}}

define-command -hidden fzf-file %{ evaluate-commands %sh{
    cmd="fd --color always --type f --follow 2>/dev/null"

    fzf_args=" \
    	-m \
    	--ansi \
        --preview 'fzf_bat_preview {1} 0' \
        --preview-window up:50% \
        --no-mouse \
        --no-hscroll \
    "

    printf "fzf %s %s %s %s\n" \
        "-kak-cmd %{edit -existing}" \
        "-fzf-args %{$fzf_args}" \
        "-items-cmd %{$cmd}"
}}
