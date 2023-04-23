hook global BufOpenFile .* %{ evaluate-commands %sh{
    if [ -z "${kak_opt_filetype}" ]; then
        mime=$(file -b --mime-type -L "${kak_buffile}")
        mime=${mime%;*}
        case "${mime}" in
            application/*+xml)  filetype="xml"                    ;;
            image/*+xml)        filetype="xml"                    ;; #SVG
            message/rfc822)     filetype="mail"                   ;;
            text/x-shellscript) filetype="sh"                     ;;
            text/x-script.*)    filetype="${mime#text/x-script.}" ;;
            text/x-*)           filetype="${mime#text/x-}"        ;;
            text/*)             filetype="${mime#text/}"          ;;
            application/x-*)    filetype="${mime#application/x-}" ;;
            application/*)      filetype="${mime#application/}"   ;;
        esac
        if [ -n "${filetype}" ]; then
            printf "set-option buffer filetype '%s'\n" "${filetype}"
        fi
    fi
} }

# Remove the scratch buffer message.
hook global BufCreate \*scratch\* %{
    execute-keys -draft <%>d<esc>
}

# language server integration
# eval %sh{kak-lsp --kakoune -s $kak_session}
# hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
#     lsp-enable-window
# }
