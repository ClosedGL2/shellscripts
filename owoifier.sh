#!/bin/sh

# Uses regex substitution to translate text into furry text.

# read from input file if specified
if [ $# -gt 0 ]
then
	# cat specified file into pipeline
	cat "$1" |
	sed -r 's/[rl]/w/g' |
	sed -r 's/[RL]/W/g'
else
	# read from stdin into pipeline
	sed -r 's/[rl]/w/g' |
	sed -r 's/[RL]/W/g'
fi
