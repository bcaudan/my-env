#!/usr/bin/env bash
OPT_DIR="/usr/local/opt"
CONF_DIR="$HOME/Library"
BIN_DIR="/usr/local/bin"
BREW_BIN_DIR="/usr/local/sbin"
USER_BIN_DIR="$HOME/bin"

export EDITOR="vi"

setopt rmstarsilent

export FPATH="$FPATH:$USER_BIN_DIR"
export PATH="$USER_BIN_DIR:$BIN_DIR:$BREW_BIN_DIR:$PATH:$OPT_DIR/ruby/bin"

export LANG="en_US.UTF-8" 
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
