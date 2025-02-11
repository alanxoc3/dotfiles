# lua is assumed to be pico-8 variant :)

hook global BufCreate .*[.](lua|p8) %{
    set-option buffer filetype lua
    map buffer goto d '<esc>:goto-doc-def %sh{printf $HOME/doc/pico8.txt} %{^    %%\(} %{\b%%\b} %{%%}<ret>' -docstring 'goto documentation'
}

hook -group lua-highlight global WinSetOption filetype=lua %{
    add-highlighter window/lua ref lua
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/lua }
}

add-highlighter shared/lua regions
add-highlighter shared/lua/code default-region group
add-highlighter shared/lua/raw_string  region -match-capture '\[(=*)\['   '\](=*)\]'       fill string
add-highlighter shared/lua/raw_comment region -match-capture '--\[(=*)\[' '\](=*)\]'       fill comment
add-highlighter shared/lua/double_string region '"'   (?<!\\)(?:\\\\)*" fill string
add-highlighter shared/lua/single_string region "'"   (?<!\\)(?:\\\\)*' fill string
add-highlighter shared/lua/comment       region '--'  $                 fill comment

add-highlighter shared/lua/code/keyword regex \b(and|break|do|else|elseif|end|for|function|goto|if|in|not|or|repeat|return|then|until|while)\b 0:keyword
add-highlighter shared/lua/code/value regex \b(false|nil|true|[0-9]+(:?\.[0-9])?(:?[eE]-?[0-9]+)?|0x[0-9a-fA-F])\b 0:value
add-highlighter shared/lua/code/operator regex (\+|-|\*|/|%|\^|==?|~=|<=?|>=?|\.\.|\.\.\.|#) 0:operator
add-highlighter shared/lua/code/builtin regex \b(_G|_E)\b 0:builtin
add-highlighter shared/lua/code/module regex \b(_G|_E)\b 0:module
add-highlighter shared/lua/code/attribute regex \b(local)\b 0:attribute
add-highlighter shared/lua/code/function_declaration regex \b(?:function\h+)(?:\w+\h*\.\h*)*([a-zA-Z_]\w*)\( 1:function
add-highlighter shared/lua/code/function_call regex \b([a-zA-Z_]\w*)\h*(?=[\(\{]) 1:function
