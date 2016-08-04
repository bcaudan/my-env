#!/usr/bin/env bash
alias ll="ls -lGh"
alias clean="rm *~"
alias myip='ifconfig en1 | grep "inet " | cut -d" " -f2'

alias dev="cd ~/Developpement"
alias cs="cd $CS_HOME/workspace"
alias csw="cd $CS_HOME/cs-env/www"

alias glog="git lg --graph --decorate --all"

alias ssh-refresh="cd $CS_HOME/docs/config/dot_ssh/ && ./setup.sh && cd -"

alias warm="time curl -u admin:c0nt3ntsqu@re http://ci-uxanalytics.content-square.fr/healthcheck"

alias cs-env-start='
  export LOCAL_IP=`ifconfig en0 | grep "inet " | cut -d" " -f2` ;
  docker-machine start cs-env ;
  eval "$(docker-machine env cs-env)" &&
  export DOCKER_HOST_IP=`docker-machine ip cs-env` &&
  cd $CS_ENV_DIR/dev-osx &&
  rm -rf /var/cache/symfony/* &&
  docker-compose up'
