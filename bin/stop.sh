#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "sourcing: ${DIR}/variables.sh"
source ${DIR}/variables.sh
if [ -d "$DIRECTORY" ]; then
	set +e
	cd ${RUNTIME}/karaf/bin
	./stop
fi



