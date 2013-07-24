#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE=${DIR}
TMP=$BASE/tmp
RUNTIME=$BASE/target
TIPIDIR=$BASE/../../tipi
DOWNLOAD=$TMP/download
KARAF_VERSION=apache-karaf-3.0.0.RC1
KARAF_FILE=${KARAF_VERSION}.tar.gz
KARAF_CONFIG=${DIR}/${KARAF_VERSION}.config
KARAF_URL=http://ftp.nluug.nl/internet/apache/karaf/3.0.0.RC1/
NAVAJO_OPTS="-DtipiDir=${TIPIDIR}"
INTERNAL_IP=$OPENSHIFT_INTERNAL_IP
