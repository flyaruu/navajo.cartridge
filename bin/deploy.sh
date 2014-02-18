#!/bin/sh
set -x
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
getsrc() {
	echo $1
	echo $2
    ( cd "$2" && curl -O "$1" )
}

source $DIR/variables.sh
downloadKaraf() {
	if [ ! -d ${DOWNLOAD} ]; then
		mkdir -p ${DOWNLOAD}
	fi
	if [ ! -f ${DOWNLOAD}/${KARAF_FILE} ]; then
		echo "needs download"
		getsrc ${KARAF_URL}${KARAF_FILE} ${DOWNLOAD}
	fi
}

installKaraf() {
	if [ -d ${RUNTIME} ]; then
		echo "Directory: ${RUNTIME} present, not redeploying"
		#echo "Nah, redeploying anyway"
		return 0;
	fi
	rm -rf $RUNTIME
	mkdir -p $RUNTIME
	cd $RUNTIME
	cp $DOWNLOAD/$KARAF_FILE .
	tar xfz $KARAF_FILE
	rm $KARAF_FILE
	mv $KARAF_VERSION karaf
	cd karaf
	cp -r ${KARAF_CONFIG}/* .
	cp ${DIR}/*.sh bin/ 
}
 
downloadKaraf
installKaraf
