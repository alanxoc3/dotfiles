# fzf file command

hook global ModuleLoaded fzf %§
map global fzf f ': fzf-file<ret>' -docstring 'open file'

define-command -hidden fzf-file %{ evaluate-commands %sh{
    cmd="fd --type f --follow 2>/dev/null"

    fzf_args=" \
    	-m \
        --preview 'fzf_bat_preview {1} 0' \
        --preview-window up:50% \
        --no-mouse \
        --expect $kak_opt_fzf_window_map \
        --expect $kak_opt_fzf_vertical_map \
        --expect $kak_opt_fzf_horizontal_map \
        --no-hscroll \
    "

    printf "fzf %s %s %s %s\n" \
        "-kak-cmd %{edit -existing}" \
        "-fzf-args %{$fzf_args}" \
        "-items-cmd %{$cmd}"
}}

§
