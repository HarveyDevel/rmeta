#!/bin/bash
#
# ***WARNING*** ALL FILES IN THE ACTIVE WORK DIRECTORY WILL BE CHANGED
#
# Script requires:
# mkvpropedit (Part of the mkvtoolnix package)
# kid3-cli

echo -e "\E[1;33m"

warning=("*** WARNING *** - This will change title metadata of every .mkv or .mp4 file in the current directory to its filename" "Your current work directory is $PWD")
options=("Select one of the following options:" "1 For mkv files" "2 For mp4 files" "3 For both mkv and mp4 files" "4 To exit")
printf '%s\n' "${warning[@]}" "" "${options[@]}"

read -n 1 opt
echo -e "\n"

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
			mkvpropedit "$mkv" -e info -s title="$mkv"
		done
		for mp4 in *.mp4
		do
			kid3-cli -c "set title '$mp4'" "$mp4"
		done
		;; 
	*)
		echo -e "No metadata was changed\nExiting..."
		;;
esac