#!/bin/bash
# Script requires: mkvtoolnix and kid3

case "$1" in
    mkv | --mkv )
        for mkv in *.mkv
        do
            mkvpropedit "$mkv" -e info -s title="$mkv"
        done
    ;;

    mp4 | --mp4 )
        for mp4 in *.mp4
        do
            kid3-cli -c "set title '$mp4'" "$mp4"
        done
        echo "Title metadata has been changed"
    ;;

    all | --all )
        for mkv in *.mkv
        do
            mkvpropedit "$mkv" -e info -s title="$mkv"
        done
        for mp4 in *.mp4
        do
            kid3-cli -c "set title '$mp4'" "$mp4"
        done
        echo "Title metadata has been changed"
    ;;

    * )
        echo -e "\E[1;33mPlease note this will modify the meta data for ALL files matching the chosen option in this directory:\033[1m\033[0m\n$PWD
        
        Usage: [command] [argument]

        For mkv files:
        rmeta mkv
        
        For mp4 files:
        rmeta mp4
        
        For both mkv and mp4 files:
        rmeta all"
    ;;
esac