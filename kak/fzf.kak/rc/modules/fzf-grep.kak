# Fzf grep command

hook global ModuleLoaded fzf %§
map global fzf g ': fzf-grep<ret>' -docstring 'grep file contents recursively' 

define-command -hidden fzf-grep %{ evaluate-commands %sh{
    grep_cmd="rg --line-number --no-column --no-heading --color=never '' 2>/dev/null"

    fzf_args=" \
        --delimiter : \
        --nth 3.. \
        --no-mouse \
        --preview 'fzf_bat_preview {1} {2}' \
        --preview-window up:50% \
        --no-mouse \
        --expect $kak_opt_fzf_window_map \
        --expect $kak_opt_fzf_vertical_map \
        --expect $kak_opt_fzf_horizontal_map \
        --no-hscroll \
    "

    printf "fzf %s %s %s %s\n" \
        "-kak-cmd %{evaluate-commands}" \
        "-fzf-args %{$fzf_args}" \
        "-items-cmd %{$grep_cmd}" \
        "-filter %{sed -E 's/([^:]+):([^:]+):.*/edit -existing \1; execute-keys \2gvcx/'}"
}}

§
