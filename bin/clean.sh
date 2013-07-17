#!/bin/sh
source ./variables.sh
echo "Cleaning folder: ${RUNTIME}"
rm -rf ${RUNTIME}
echo "Cleaning temp: ${TMP}"
rm -rf ${TMP}
