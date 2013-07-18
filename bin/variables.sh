#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -z ${OPENSHIFT_APP_NAME} ]; then
        echo "No Openshift detected, deploying to ${DIR}/../"
        BASE=$DIR/../
	REPO_BASE=$BASE
	INTERNAL_IP=0.0.0.0
else
        echo "Openshift detected, deploying to ${OPENSHIFT_DATA_DIR}"
        BASE=$OPENSHIFT_DATA_DIR
	REPO_BASE=$OPENSHIFT_NAVAJO_DIR #$OPENSHIFT_REPO_DIR
	INTERNAL_IP=$OPENSHIFT_INTERNAL_IP
fi

TMP=$BASE/tmp
RUNTIME=$BASE/runtime
TIPIDIR=$BASE/../../tipi
DOWNLOAD=$TMP/download
KARAF_VERSION=apache-karaf-3.0.0.RC1
KARAF_FILE=${KARAF_VERSION}.tar.gz
KARAF_CONFIG=$REPO_BASE/${KARAF_VERSION}.config
KARAF_URL=http://ftp.nluug.nl/internet/apache/karaf/3.0.0.RC1/
NAVAJO_OPTS="-DtipiDir=${TIPIDIR}"
KARAF_HOME=$OPENSHIFT_NAVAJO_DIR
KARAF_DATA=$OPENSHIFT_DATA_DIR/karafdata
