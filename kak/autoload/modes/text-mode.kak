# text-mode

try %{ declare-user-mode text-mode }

define-command text-mode %{ require-module text-mode; evaluate-commands 'enter-user-mode text-mode' }

hook global ModuleLoaded text-mode %{
    map -docstring 'Format a paragraph to respect the 80 character limit.' global text-mode p ': text-mode-format<ret>'
}

provide-module text-mode %~
    define-command -hidden text-mode-format %{ execute-keys '<|>tr "\n" " " | fold -s | awk "{\$1=\$1};1"<ret>' }
~

