#!/usr/bin/env bash

export GREP_COLOR="01;31"
grp(){
	grep --color=always -nri "$@" *
}

sp() {
    # show process running on given port
	lsof -i ":$1"
}

kp() {
    # kill process running on given port
	kill -9 $(lsof -t -i ":$1")
}

dc-replace-ip() {
    local IP=$(ipconfig getifaddr en0 || ipconfig getifaddr en1)
	sed -i '' "s/webstack_php:.*/webstack_php:$IP/g" $CS_HOME/devenv-symfony-compose/docker-compose.yml
}

uxasqs-up() {
	cd "$CS_HOME/alias-goals-processing" && workon uxasqs && python script.py config/parameters_localdev.json
}

rv-tags() {
	local commit="$1"
	if [[ -z "$1" ]]
	then
		commit="HEAD"
	fi
	rbt post -p --target-groups=Tags $commit
}

rv-appli() {
	local commit="$1"
	if [[ -z "$1" ]]
	then
		commit="HEAD"
	fi
	rbt post -p --target-groups=Frontend $commit
}

checkCDN() {
	local hash="$1"
	local cdn="http://d1m6l9dfulcyw7.cloudfront.net/uxt/${hash}.js"
	getTag() {
		curl "http://d1m6l9dfulcyw7.cloudfront.net/uxt/${hash}.js" -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --compressed -s
	}
	initVal=$(getTag)
    newVal=$initVal
    while [  "$initVal" = "$newVal" ]; do
		echo -n "."
		sleep 5
		newVal=$(getTag) 
	done
	echo "\nUpdated"
}

git-push-until() {
    # git push given branch until given commit
    # git push my-branch HEAD^
	git pull && git co -b WIP && git branch -f $1 $2 && git co $1 && git push && git co WIP && git branch -f $1 && git co $1 && git branch -D WIP
}
