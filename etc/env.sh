#!/usr/bin/env bash
OPT_DIR="/usr/local/opt"
CONF_DIR="$HOME/Library"
BIN_DIR="/usr/local/bin"
BREW_BIN_DIR="/usr/local/sbin"
USER_BIN_DIR="$HOME/bin"

setopt rmstarsilent

export FPATH="$FPATH:$USER_BIN_DIR"
export PATH="$USER_BIN_DIR:$BIN_DIR:$BREW_BIN_DIR:$PATH:$OPT_DIR/ruby/bin"

# Docker
export LOCAL_IP=`ipconfig getifaddr en0 || ipconfig getifaddr en4`
export DOCKER_HOST_IP=$LOCAL_IP

# nvm
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

