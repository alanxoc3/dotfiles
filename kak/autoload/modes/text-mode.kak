# text-mode

try %{ declare-user-mode text-mode }

define-command toggle-highlighter -params 2.. -docstring 'toggle-highlighter <path>/[name] <type> [type-params…]' %{
  try %{
    add-highlighter %arg{@}
    echo -markup "{green}add-highlighter %arg{@}{Default}"
  } catch %{
    evaluate-commands %sh{
      auto_name() {
        printf '%s' "$*" | sed '
          s_/_<slash>_g
          s/ /_/g
        '
      }

      path=$1
      case "$path" in
        *'/')
          auto_name=$(shift; auto_name "$@")
          path=${path}${auto_name}
          ;;
      esac

      # Execute the command
      printf 'remove-highlighter "%s"\n' "$path"
      printf 'echo -markup "{red}remove-highlighter %s{Default}"\n' "$path"
    }
  }
}

define-command text-mode %{ require-module text-mode; evaluate-commands 'enter-user-mode text-mode' }

hook global ModuleLoaded text-mode %{
    map -docstring 'Format a paragraph to respect the 80 character limit.' global text-mode p ': text-mode-format<ret>'
    map -docstring 'Toggle wrap all buffers.' global text-mode w ': toggle-highlighter global/ wrap -word -indent<ret>'
    map -docstring 'Toggle line numbers for all buffers.' global text-mode n ': toggle-highlighter global/ number-lines<ret>'
}

provide-module text-mode %~
    define-command -hidden text-mode-format %{ execute-keys '<|>tr "\n" " " | fold -s | awk "{\$1=\$1};1"<ret>' }
~
