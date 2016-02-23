# grep
export GREP_COLOR="01;31"
grp(){
	grep --color=always -nri "$@" *
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

#cs-up() {
#    $(boot2docker shellinit 2> /dev/null) && cd $CS_HOME/devenv-symfony-compose && workon fig && fig-replace-ip && fig up
#

cs-up() {
    boot2docker up && $(boot2docker shellinit 2> /dev/null) && cd $CS_HOME/devenv-symfony-compose && workon compose && dc-replace-ip && docker-compose up -d && docker-compose logs
}

dc-replace-ip() {
    local IP=$(ipconfig getifaddr en0 || ipconfig getifaddr en1)
	sed -i '' "s/webstack_php:.*/webstack_php:$IP/g" $CS_HOME/devenv-symfony-compose/docker-compose.yml
}

uxasqs-up() {
	cd "$CS_HOME/alias-goals-processing" && workon uxasqs && python script.py config/parameters_localdev.json
}

rvf() {
	local commit="$1"
	if [[ -z "$1" ]]
	then
		commit="HEAD"
	fi
	rbt post -p --target-groups=Frontend $commit
}

rvb() {
	local commit="$1"
	if [[ -z "$1" ]]
	then
		commit="HEAD"
	fi
	rbt post -p --target-groups=Backend $commit
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
	git pull && git co -b WIP && git branch -f $1 $2 && git co $1 && git push && git co WIP && git branch -f $1 && git co $1 && git branch -D WIP
}
