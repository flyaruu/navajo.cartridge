#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/variables.sh
updateConfig() {
	echo "Runtime dir detected, running update"
	cd $RUNTIME
	cd karaf
	cp -r ${KARAF_CONFIG}/* .
}
if [ -d "$RUNTIME" ]; then
       updateConfig 
else
       source $DIR/deploy.sh
fi
