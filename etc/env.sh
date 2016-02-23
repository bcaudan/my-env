OPT_DIR="/usr/local/opt"
CONF_DIR="$HOME/Library"
BIN_DIR="/usr/local/bin"
BREW_BIN_DIR="/usr/local/sbin"
USER_BIN_DIR="$HOME/bin"
CS_HOME="/Users/bcaudan/Projets/ContentSquare"

setopt rmstarsilent

export GATLING_HOME="/Users/bcaudan/Developpement/gatling-charts-highcharts-bundle-2.1.4"

# Tomcat
export CATALINA_HOME="$OPT_DIR/apache-tomcat"
export CATALINA_BASE="$CONF_DIR/Tomcat"

# Ruby env
export RBENV_ROOT="$OPT_DIR/rbenv"

export SCALA_HOME="$OPT_DIR/scala/idea"
export FPATH="$FPATH:$USER_BIN_DIR"
export PATH="$USER_BIN_DIR:$BIN_DIR:$BREW_BIN_DIR:$PATH:$SCALA_HOME:$GRADLE_HOME:$OPT_DIR/ruby/bin"
export KARMA_BROWSER="Chrome"

# Gradle build
export GRADLE_OPTS="-XX:MaxPermSize=512m -Xmx1g"
export JAVA_OPTS="-XX:+CMSClassUnloadingEnabled -Xms256m -Xmx1024m -XX:MaxPermSize=384m -XX:ReservedCodeCacheSize=192m -Dfile.encoding=UTF8"

# AYAH
export AYAH_PUBLIC="bda562d8706717cd6f4813e0a307beddd223e55a"
export AYAH_SCORING="c781dfe215641ee727acec94849f47b5c90723de"

# Grails
export GRAILS_OPTS="$GRAILS_OPTS -Dnew.slot.recipient=test@test.com"
export GRAILS_OPTS="$GRAILS_OPTS -Dmailgun.username=R" 
export GRAILS_OPTS="$GRAILS_OPTS -Dmailgun.password=S" 
export GRAILS_OPTS="$GRAILS_OPTS -Dauth.google.key=T" 
export GRAILS_OPTS="$GRAILS_OPTS -Dauth.google.secret=U"
export GRAILS_OPTS="$GRAILS_OPTS -Ddatabase.url=127.0.0.1" 
export GRAILS_OPTS="$GRAILS_OPTS -Ddatabase.port=27017"
export GRAILS_OPTS="$GRAILS_OPTS -Ddatabase.username=xke" 
export GRAILS_OPTS="$GRAILS_OPTS -Ddatabase.password=xke" 
export GRAILS_OPTS="$GRAILS_OPTS -Ddatabase.name=xke"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# CS SSH
export CS_USER="bastien"
export AWS_USER="bastienc"

# Docker
#eval "$(docker-machine env cs-env)"
#export DOCKER_HOST_IP=`docker-machine ip cs-env`
export LOCAL_IP=`ifconfig en0 | grep "inet " | cut -d" " -f2`
alias cs-env-start='
  docker-machine start cs-env ; 
  eval "$(docker-machine env cs-env)" &&
  export DOCKER_HOST_IP=`docker-machine ip cs-env` &&
  cd $CS_HOME/cs-env/dev-osx &&
  rm -rf /var/cache/symfony/* && 
  docker-compose up'


# workspace
export HUB_LOCAL_WORKSPACE="$CS_HOME/workspace/hub"
export UXA_LOCAL_WORKSPACE="$CS_HOME/workspace/mousetest"
export PUBLICITEST_LOCAL_WORKSPACE="$CS_HOME/workspace/publicitest"
export PS_LOCAL_WORKSPACE="$CS_HOME/workspace/ps"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source aws-commands.sh
