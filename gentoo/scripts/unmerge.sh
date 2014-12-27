#!/bin/bash

show_packages() {
    echo "checking dependencies for ${1}"
    equery d "${1}"
}

ask() {
    # http://djm.me/ask
    while true; do
	
	if [ "${2:-}" = "Y" ]; then
	    prompt="Y/n"
	    default=Y
	elif [ "${2:-}" = "N" ]; then
	    prompt="y/N"
	    default=N
	else
	    prompt="y/n"
	    default=
	fi
	
	# Ask the question
	read -p "$1 [$prompt] " REPLY
	
	# Default?
	if [ -z "$REPLY" ]; then
	    REPLY=$default
	fi
	
	# Check if the reply is valid
	case "$REPLY" in
	    Y*|y*) return 0 ;;
	    N*|n*) return 1 ;;
	esac
	
    done
}

perform_unmerge() {
    emerge --unmerge $(equery d "${1}" | sed 's/^ *\([^ ]*\)-[0-9].*/\1/' | sort -u |  tr '\n' ' ') ${1}
}

show_packages "${1}"
ask "Do you want to do remove all those packages?" && perform_unmerge "${1}"
