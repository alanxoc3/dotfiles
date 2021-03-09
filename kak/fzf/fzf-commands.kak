# Command Mappings
hook global ModuleLoaded fzf %{
    map global fzf r ': fzf-grep<ret>' -docstring 'grep file contents recursively' 
    map global fzf f ': fzf-file<ret>' -docstring 'open file'
}

# --------------
#    fzf-grep
# --------------

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

# --------------
#    fzf-file
# --------------

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
