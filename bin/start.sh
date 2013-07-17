#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "sourcing: ${DIR}/variables.sh"
source ${DIR}/variables.sh


echo "moving to: ${RUNTIME}/karaf/bin"
cd ${RUNTIME}/karaf/bin
./start



