#!/bin/bash
# Script requires: mkvtoolnix and kid3

case "$1" in
    mkv | --mkv )
        for mkvname in *.mkv
        do
            mkvpropedit "$mkvname" -e info -s title="$(basename -s .mkv "$mkvname")"
        done
    ;;

    mp4 | --mp4 )
        for mp4name in *.mp4
        do
            kid3-cli -c "set title '$(basename -s .mp4 "$mp4name")'" "$mp4name"
            echo "Title metadata of $mp4name has been changed"
        done
    ;;

    all | --all )
        for mkvname in *.mkv
        do
            mkvpropedit "$mkvname" -e info -s title="$(basename -s .mkv "$mkvname")"
        done
        for mp4name in *.mp4
        do
            kid3-cli -c "set title '$(basename -s .mp4 "$mp4name")'" "$mp4name"
            echo "Title metadata of $mp4name has been changed"
        done
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