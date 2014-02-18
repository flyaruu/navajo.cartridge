#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${DIR}/variables.sh
echo "Cleaning folder: ${RUNTIME}"
rm -rf ${RUNTIME}
echo "Cleaning temp: ${TMP}"
rm -rf ${TMP}
