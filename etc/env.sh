OPT_DIR="/usr/local/opt"
BIN_DIR="/usr/local/bin"
CONF_DIR="$HOME/Library"
USER_BIN_DIR="$HOME/bin"

# Tomcat
export CATALINA_HOME="$OPT_DIR/apache-tomcat"
export CATALINA_BASE="$CONF_DIR/Tomcat"

# Ruby env
export RBENV_ROOT="$OPT_DIR/rbenv"

export SCALA_HOME="$OPT_DIR/scala/idea"
export FPATH="$FPATH:$USER_BIN_DIR"
export PATH="$USER_BIN_DIR:$BIN_DIR:$PATH:$SCALA_HOME:$GRADLE_HOME:$OPT_DIR/ruby/bin"
export KARMA_BROWSER="Chrome"

# Gradle build
export GRADLE_OPTS="-XX:MaxPermSize=512m -Xmx1g"

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

#virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

