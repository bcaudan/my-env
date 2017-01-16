#!/usr/bin/env bash
OPT_DIR="/usr/local/opt"
CONF_DIR="$HOME/Library"
BIN_DIR="/usr/local/bin"
BREW_BIN_DIR="/usr/local/sbin"
USER_BIN_DIR="$HOME/bin"
CS_HOME="$HOME/Projets/ContentSquare"

setopt rmstarsilent

export FPATH="$FPATH:$USER_BIN_DIR"
export PATH="$USER_BIN_DIR:$BIN_DIR:$BREW_BIN_DIR:$PATH:$OPT_DIR/ruby/bin"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# CS SSH
export CS_USER="bastien"
export AWS_USER="bastienc"

# Docker
export LOCAL_IP=`ipconfig getifaddr en0 || ipconfig getifaddr en4`
export DOCKER_HOST_IP=$LOCAL_IP

# workspace
export CS_ENV_DIR="$CS_HOME/cs-env"
export LOCAL_WORKSPACE="$CS_HOME/workspace"
export HUB_LOCAL_WORKSPACE="$CS_HOME/workspace/hub"
export UXA_LOCAL_WORKSPACE="$CS_HOME/workspace/mousetest"
export PUBLICITEST_LOCAL_WORKSPACE="$CS_HOME/workspace/publicitest"
export PS_LOCAL_WORKSPACE="$CS_HOME/workspace/ps"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source aws-commands.sh
