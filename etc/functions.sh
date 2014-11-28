# grep
export GREP_COLOR="01;31"
grp(){
	grep --color=always -nri "$@" *
}

tree(){
	find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'
}

karmab(){
	if [[ -z "$1" ]]
	then
		echo $KARMA_BROWSER
	else
		export KARMA_BROWSER="$1"
	fi
}

sp() {
	lsof -i ":$1"
}

kp() {
	kill -9 $(lsof -t -i ":$1")
}
