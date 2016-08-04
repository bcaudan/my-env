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

wait-invalidation() {
    local id=${1}
    local distributionId=${2-E24HI6P9ZROFKJ}
    while [ -n "$(aws cloudfront get-invalidation --id $id --distribution-id $distributionId | grep InProgress)" ]
    do 
        echo -n "."
        sleep 10 
    done
    notify Invalidation $id complete
}

wait-distribution() {
    local distributionId=${1-E24HI6P9ZROFKJ}
    while [ -n "$(aws cloudfront get-distribution --id $distributionId | grep Status | grep InProgress)" ]
    do
        echo -n "."
    sleep 10
    done
    notify Distribution $distributionId deployed
}

git-push-until() {
    # git push given branch until given commit
    # git push my-branch HEAD^
    git pull && git co -b WIP && git branch -f $1 $2 && git co $1 && git push && git co WIP && git branch -f $1 && git co $1 && git branch -D WIP
}
