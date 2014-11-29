alias ll="ls -lGh"
alias st="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
alias clean="rm *~"
alias myip='ifconfig en1 | grep "inet " | cut -d" " -f2'

alias dev="cd ~/Developpement"
alias ri="cd ~/Projets/xebialabs/xl-release/"
CS_HOME="~/Projets/ContentSquare/"
alias cs="cd $CS_HOME"
alias teach="cd ~/Projets/teacheasy/"

alias karmaNoSlices='export KARMA_SLICES=1'

alias teak="kill \`ps x -o pid,command | grep 'rails server' | grep -v grep | sed 's/\([0-9]*\).*/\1/'\`"

alias glog="git lg --graph --decorate --all"

alias octave="/usr/local/octave/3.8.0/bin/octave-3.8.0"

alias ssh-refresh="cd $CS_HOME/docs/config/dot_ssh/ && ./setup.sh && cd -"

# Tomcat
alias tomcat-start="$CATALINA_HOME/bin/startup.sh"
alias tomcat-stop="$CATALINA_HOME/bin/shutdown.sh"
alias tomcat-log="tail -f $CATALINA_BASE/logs/catalina.out"
alias tomcat-dir="cd $CATALINA_BASE"

