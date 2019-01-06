# Couleurs du préfix du terminal
export CLICOLOR=1
NM="\[\033[0;38m\]"
HI="\[\033[0;37m\]"
HII="\[\033[0;36m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"

# Git prompt
source ~/.git-prompt.sh

export PS1="$NM[ $HI\u $SI\w$HII"'$(__git_ps1)'"$NM ] $IN"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ];
then
   source ~/.bashrc
fi
