#!/bin/sh

# Copies scripts to /opt and links to them in /usr/local/bin,
# so they can be used anywhere

# check if root
if [ $(whoami) == "root" ]
then
	# create script directory
	mkdir /opt/cglscripts

	# copy scripts
	cp ./randcopypasta.sh /opt/cglscripts/
	cp ./owoifier.sh /opt/cglscripts/
	cp ./manpagepdf.sh /opt/cglscripts/
	
	# make executable if not already
	cd /opt/cglscripts/
	chmod +x randcopypasta.sh
	chmod +x owoifier.sh
	chmod +x manpagepdf.sh

	# link to scripts in /usr/local/bin
	cd /usr/local/bin/
	ln -s /opt/cglscripts/randcopypasta.sh randcopypasta
	ln -s /opt/cglscripts/owoifier.sh owoifier
	ln -s /opt/cglscripts/manpagepdf.sh manpagepdf
else
	echo "install: Must run as root" >> /dev/stderr
fi
