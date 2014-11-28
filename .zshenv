GLOBAL_CONF_DIR="$HOME/etc"

# Environment
if [ -f $GLOBAL_CONF_DIR/env.sh ]; then
	. $GLOBAL_CONF_DIR/env.sh
fi
