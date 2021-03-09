# ╭─────────────╥────────────────────────╮
# │ Author:     ║ File:                  │
# │ Andrey Orst ║ fzf-buffer.kak         │
# ╞═════════════╩════════════════════════╡
# │ Module for changing buffers with fzf │
# │ for fzf.kak plugin                   │
# ╞══════════════════════════════════════╡
# │ GitHub.com/andreyorst/fzf.kak        │
# ╰──────────────────────────────────────╯

hook global ModuleLoaded fzf %§

map global fzf -docstring "open buffer" 'b' '<esc>: fzf-buffer<ret>'
map global fzf -docstring "delete buffer" '<a-b>' '<esc>: fzf-delete-buffer<ret>'

define-command -hidden fzf-buffer %{ evaluate-commands %sh{
    buffers=""
    eval "set -- $kak_quoted_buflist"
    while [ $# -gt 0 ]; do
        buffers="$1
$buffers"
        shift
    done

    printf "%s\n" "fzf -kak-cmd %{buffer} -items-cmd %{printf \"%s\n\" \"$buffers\"}"
}}

define-command -hidden fzf-delete-buffer %{ evaluate-commands %sh{
    buffers=""
    eval "set -- $kak_quoted_buflist"
    while [ $# -gt 0 ]; do
        buffers="$1
$buffers"
        shift
    done

    message="Delete buffer.
<ret>: delete selected buffer."
    printf "%s\n" "info -title 'fzf delete-buffer' '$message'"
    printf "%s\n" "fzf -kak-cmd %{delete-buffer} -multiple-cmd %{delete-buffer} -items-cmd %{printf \"%s\n\" \"$buffers\"} -fzf-args %{-m}"
}}

§
