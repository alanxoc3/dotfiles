# ╭─────────────╥────────────────────────╮
# │ Author:     ║ File:                  │
# │ Andrey Orst ║ fzf-grep.kak           │
# ╞═════════════╩════════════════════════╡
# │ Module for grepping file contents    │
# ╞══════════════════════════════════════╡
# │ GitHub.com/andreyorst/fzf.kak        │
# ╰──────────────────────────────────────╯

hook global ModuleLoaded fzf %§

declare-option -docstring "what command to use to provide list of grep search matches.
Grep output must follow the format of 'filename:line-number:text'

Default value:
    grep -RHn" \
str fzf_grep_command 'grep'

map -docstring 'grep file contents recursively' global fzf g ': fzf-grep<ret>'

define-command -hidden fzf-grep %{ evaluate-commands %sh{
    fzf_args="--expect $kak_opt_fzf_window_map --expect $kak_opt_fzf_vertical_map --expect $kak_opt_fzf_horizontal_map"
    cmd="rg --line-number --no-column --no-heading --color=never '' 2>/dev/null"

    printf "fzf %s %s %s %s\n" \
        "-kak-cmd %{evaluate-commands}" \
        "-fzf-args %{$fzf_args}" \
        "-items-cmd %{$cmd}" \
        "-filter %{sed -E 's/([^:]+):([^:]+):.*/edit -existing \1; execute-keys \2gvc/'}"
}}

§
