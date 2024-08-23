hook global BufCreate .*\.zig %{
	set-option buffer filetype zig
}
