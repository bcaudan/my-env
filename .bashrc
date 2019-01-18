GLOBAL_CONF_DIR="$HOME/etc"

# Environment
if [ -f $GLOBAL_CONF_DIR/env.sh ]; then
	. $GLOBAL_CONF_DIR/env.sh
fi

# Functions
if [ -f $GLOBAL_CONF_DIR/functions.sh ]; then
	. $GLOBAL_CONF_DIR/functions.sh
fi

# Aliases
if [ -f $GLOBAL_CONF_DIR/aliases.sh ]; then
	. $GLOBAL_CONF_DIR/aliases.sh
fi

# Private
if [ -f $GLOBAL_CONF_DIR/private.sh ]; then
	. $GLOBAL_CONF_DIR/private.sh
fi

# Datadog
if [ -f $GLOBAL_CONF_DIR/dd.sh ]; then
	. $GLOBAL_CONF_DIR/dd.sh
fi
