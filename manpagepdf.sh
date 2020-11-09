#!/bin/sh

# Asks user which manual page to view, opens manual page in PDF format
# Makes reading manual pages faster and easier
# Requires dmenu, dynamic menu for X11

# You may alias dmenu to your dmenu configuration
alias dmenu="dmenu -nf '#C5C5C5' -nb '#3B3B3B' -sb '#3670BB' -sf '#FFFFFF' -fn 'monospace-10'"

# If no PDF viewer is specified in an argument, it defaults to Okular
PDFviewer="okular"

# use PDF viewer in argument if specified
if [ $# -gt 0 ]
then
	PDFviewer=$1
else
	# tell if defaulting to Okular
	echo "manpagepdf: No PDF viewer specified, defaulting to Okular" >> /dev/stderr
fi

# check if PDF viewer is installed
if which $PDFviewer >& /dev/null
then
	printf ''
else
	echo "manpagepdf: $PDFviewer: command not found" >> /dev/stderr
	exit 129
fi

# list manual pages
apropos -l . |
sort |

# prompt user for which one to view
dmenu -l 15 |

# create temp PDF file
awk "{print \$1}" |
xargs -r man -Tpdf > /tmp/manpage.pdf &&

# open with PDF viewer
$PDFviewer /tmp/manpage.pdf >& /dev/null

# delete PDF when done
rm /tmp/manpage.pdf
