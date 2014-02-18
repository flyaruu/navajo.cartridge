#!/bin/sh
set -e
set -z

if [ -z ${OPENSHIFT_APP_NAME} ]; then
  echo "OPENSHIFT DETECTED:"
  set

else
fi


export RMI_REGISTRY_PORT=31099
export RMI_SERVER_PORT=34444
export KARAF_SSH=18101
export HTTP_PORT=8080

