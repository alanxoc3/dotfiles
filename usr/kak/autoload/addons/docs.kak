# this is a command that can be used to go to the documentation for something.
# documentation should be a file on your computer, you just need to pass the doc file and a regex to this command and it will use ripgrep to jump to the line in the doc

# goto-doc-def <file> <regex>
# regex should have %%, which is replaced with value
define-command -params 2.. -hidden goto-doc-def %{
    evaluate-commands -save-regs s %{
        evaluate-commands -draft %{
            execute-keys %sh{
                if [ $(printf "%s" "${kak_selection}" | wc -m) -le 1 ]; then
                    printf '<a-i>w'
                fi
            }

            set-register s %sh{
            	FILENAME="$1"
            	shift
            	while [ -z "$LINE_NUMBER" ] && [ "$#" -gt 0 ]; do
            		REGEX="$1"
                    if [ $(printf "%s" "${kak_selection}" | wc -m) -gt 1 ]; then
                    	# pcre - enables lookahead regex syntax
                    	# U - enables multiline regex expressions
                        LINE_NUMBER=$(rg --pcre2 -U -i --line-number --no-column --no-heading "$(sed -E "s/%%/${kak_selection}/g" <<< "$REGEX")" "$FILENAME" | \
                            head -n 1 | \
                            awk -F : '{print $1}'
                        )
                    fi
            		shift
                done

                if [[ -n "$LINE_NUMBER" ]]; then
                    printf 'edit -existing %s; execute-keys %sgvtx' "${FILENAME}" "$LINE_NUMBER"
                else
                    printf 'nop'
                fi
            }
            
            set-register / %sh{printf "%s" '(?i)'"$kak_selection"}
        }

        evaluate-commands %reg{s}
    }
}
