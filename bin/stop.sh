#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "sourcing: ${DIR}/variables.sh"
source ${DIR}/variables.sh

cd ${RUNTIME}/karaf/bin
set +e
./stop



