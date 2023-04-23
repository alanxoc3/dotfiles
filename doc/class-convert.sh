#!/bin/bash
# this helps convert the godot documentation into a large text file
# usage: ./class-convert.sh $(fd '^class_.*\.html$' | sort -u)

echo -n > godot.txt
for f in "$@"; do
	echo "Parsing file: $f"
    cat "$f" \
        | htmlq .wy-nav-content-wrap --remove-nodes 'table, #methods, #tutorials, #properties, footer' \
        | html2text --ignore-tables --ignore-links --ignore-emphasis --ignore-images --single-line-break \
        | awk '/^# /{flag=1}flag' \
        | sed -E 's/¶//g' > "$f.txt"
	cat "$f.txt" >> godot.txt
done
