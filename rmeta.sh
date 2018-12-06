#!/bin/bash
#
# ***WARNING*** ALL FILES IN THE ACTIVE WORK DIRECTORY WILL BE CHANGED
#
# Script requires:
# mkvpropedit (Part of the mkvtoolnix package)
# kid3-cli

warn="\E[1;33m"

echo -e $warn #
echo "*** WARNING *** - This will change title metadata of every .mkv or .mp4 file in the current directory to its filename"
echo "Your current work directory is $PWD"
echo "Select one of the following options:"
echo "1 For mkv files"
echo "2 For mp4 files"
echo "3 For both mkv and mp4 files"
echo "4 To exit"

read -n 1 opt
case $opt in
	1)
		for mkv in *.mkv
		do
			mkvpropedit "$mkv" -e info -s title="$mkv"
		done
		;;
	2)
		for mp4 in *.mp4
		do
			kid3-cli -c "set title '$mp4'" "$mp4"
		done
		;;
	3)
		for mkv in *.mkv
		do
			echo #
			mkvpropedit "$mkv" -e info -s title="$mkv"
		done
		for mp4 in *.mp4
		do
			kid3-cli -c "set title '$mp4'" "$mp4"
		done
		;; 
	*)
		echo -e $warn #
		echo "No metadata was changed"
		echo "Exiting..."
		;;
esac