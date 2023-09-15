# ttrack integration

# Record time for the current file.
hook global -group ttrack RawKey . %{
  evaluate-commands %sh{
    {
      [[ $(basename $kak_bufname) =~ '.' ]] && ttrack_name="ext:${kak_bufname##*.}" || ttrack_name="misc"
      [ ! -z "$(command -v ttrack)" ] && ttrack rec "kak/$ttrack_name" 3s
    } > /dev/null 2>&1 < /dev/null &
  }
}

hook global BufCreate .+\.tt %{
    remove-hooks global ttrack
}
