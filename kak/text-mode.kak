# Formatting text.
try %{ declare-user-mode text }
define-command -docstring "Enter text-mode.
Text mode contains keybindings for different methods to format highlighted text." \
text-mode %{ evaluate-commands 'enter-user-mode text' }
map -docstring 'Format a paragraph to respect the 80 character limit.' global text p '<|>tr "\n" " " | fold -s | awk "{\$1=\$1};1"<ret>'

