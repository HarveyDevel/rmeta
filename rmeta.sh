#!/bin/bash
# Script requires: mkvtoolnix and kid3.

# Non recursive operations for mkv.
nr_mkv() {
    for mkvname in *.mkv
    do
        mkvpropedit "$mkvname" -e info -s title="$(basename -s .mkv "$mkvname")"
    done
}

# Recursive operations for mkv.
r_mkv() {
    shopt -s globstar
    for mkvname in ./**/*.mkv
    do
        mkvpropedit "$mkvname" -e info -s title="$(basename -s .mkv "$mkvname")"
    done
}

# Non recursive operations for mp4.
nr_mp4() {
    for mp4name in *.mp4
    do
        kid3-cli -c "set title '$(basename -s .mp4 "$mp4name")'" "$mp4name"
        echo "Title metadata of $mp4name has been changed"
    done
}

# Recursive operations for mp4.
r_mp4() {
    shopt -s globstar
    for mp4name in ./**/*.mp4
    do
        kid3-cli -c "set title '$(basename -s .mp4 "$mp4name")'" "$mp4name"
        echo "Title metadata of $mp4name has been changed"
    done
}


case "$1" in
    mkv | --mkv )
        if [[ $2 == "-r" ]] || [[ $2 == "--recursive" ]]; then
            r_mkv
        else
            nr_mkv
        fi
    ;;

    mp4 | --mp4 )
        if [[ $2 == "-r" ]] || [[ $2 == "--recursive" ]]; then
            r_mp4
        else
            nr_mp4
        fi
    ;;

    all | --all )
        if [[ $2 == "-r" ]] || [[ $2 == "--recursive" ]]; then
            r_mkv
            r_mp4
        else
            nr_mp4
            nr_mkv
        fi
    ;;

    * )
        echo -e "\E[1;33mPlease note this will modify the meta data for ALL files matching the chosen option in this directory:\033[1m\033[0m\n$PWD
        
        Usage: [command] [argument]

        For modifying all .mkv files in the current directory:
        rmeta mkv
        
        For modifying all .mp4 files in the current directory:
        rmeta mp4
        
        For both .mkv and .mp4 files in the current directory:
        rmeta all

        Append -r or --recursive to modify files under each directory recursively:
        rmeta mkv -r
        rmeta mp4 -r
        rmeta all -r"
    ;;
esac
