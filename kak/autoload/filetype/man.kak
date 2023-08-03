hook -group man-highlight global WinSetOption filetype=man %{
    add-highlighter window/man-highlight group
    add-highlighter window/man-highlight/ regex ^\S.*?$ 0:title
    add-highlighter window/man-highlight/ regex '^ {3}\S.*?$' 0:default+b
    add-highlighter window/man-highlight/ regex '^ {7}-[^\s,]+(,\s+-[^\s,]+)*' 0:list
    add-highlighter window/man-highlight/ regex [-a-zA-Z0-9_.]+\([a-z0-9]+\) 0:header

    hook -once -always window WinSetOption filetype=.* %{
      remove-highlighter window/man-highlight
    }
}
