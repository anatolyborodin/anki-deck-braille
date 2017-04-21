#!/bin/sh

set -e

main()
{
	rm -rf "output"
	mkdir -p "output"
	for id in $(seq 0 63)
	do
		x=$(((id % 8) * 24))
		y=$(((id / 8) * 32))
		bin=''
		for i in $(seq 1 6)
		do
			bin="$((id % 2))${bin}"
			id=$((id / 2))
		done
		convert -crop "24x32+${x}+${y}" -strip \
			"braille-all.png" "output/${bin}.png"
		echo -e "${bin}.png\t" >> "output/deck-template.txt"
	done
}

main
