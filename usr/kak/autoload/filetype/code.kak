# code is just some random language that doesn't exist. originally did this for a screen share thing.
hook global BufCreate .*[.](code) %{
    set-option buffer filetype code
    map buffer goto d '<esc>:goto-doc-def %sh{printf $HOME/doc/pico8.txt} %{^    %%\(} %{\b%%\b} %{%%}<ret>' -docstring 'goto documentation'
}

hook -group code-highlight global WinSetOption filetype=code %{
    add-highlighter window/code ref code
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/code }
}

add-highlighter shared/code regions
add-highlighter shared/code/code default-region group
add-highlighter shared/code/double_string region '"'   (?<!\\)(?:\\\\)*" fill string
add-highlighter shared/code/single_string region "'"   (?<!\\)(?:\\\\)*' fill string
add-highlighter shared/code/comment       region '#'   $                 fill comment

add-highlighter shared/code/code/keyword regex \b(func|and|break|do|else|elif|end|for|function|goto|if|in|not|or|repeat|return|then|until|while)\b 0:keyword
add-highlighter shared/code/code/operator regex (\+|-|\*|/|%|\^|==?|~=|<=?|>=?|\.\.|\.\.\.) 0:operator

