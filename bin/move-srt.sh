#!/bin/bash
readonly LOG_FILE="/var/log/move-srt.log"
readonly TMP_FILE="/tmp/move-srt.tmp"

function main() {
	parse_args "$@"
	load_saved_args
	if [[ -z $srt || -z $mov ]]
	then
		save_args
	else
		move_srt
		clear_temp_file
	fi
}

function move_srt() {
	local dir=$(dirname "$mov")
	local movname=$(basename "$mov")
	movname="${movname%.*}"

	log "$srt $dir/$movname.srt"
	mv "$srt" "$dir/$movname.srt"
}

function parse_args() {
	local key=
	while [[ $# > 1 ]]
	do
		key="$1"
		shift

		case $key in
			-srt)
				srt="$1"
				shift
				;;
			-mov)
				mov="$1"
				shift
				;;
		esac
	done
}

function load_saved_args() {
	if [[ -e $TMP_FILE ]]
	then
		. $TMP_FILE
	fi
}

function save_args() {
	if [[ ! -z $srt ]]
	then
		log "srt='$srt'"
		echo "srt='$srt'" > $TMP_FILE
	fi

	if [[ ! -z $mov ]]
	then
		log "mov='$mov'"
		echo "mov='$mov'" > $TMP_FILE
	fi
}

function clear_temp_file() {
	log "clear temp file"
	rm $TMP_FILE
}

function log() {
	local text=$1
	local date=$(date +"%d/%m/%Y %H:%M:%S")

	echo "$date: $text" >> $LOG_FILE
}

main "$@"
