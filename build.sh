#!/bin/sh 
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
	rm -rf $RUNTIME
	mkdir -p $RUNTIME
	cd $RUNTIME
	echo "Runtime: ${RUNTIME}"
	cp $DOWNLOAD/$KARAF_FILE .
	echo "KarafFile: ${DOWNLOAD}/${KARAF_FILE}"
	tar xfz $KARAF_FILE
	rm $KARAF_FILE
	mv $KARAF_VERSION karaf
	cd karaf
	cp -r ${KARAF_CONFIG}/* .
	cp ${DIR}/*.sh bin/ 
	cp ${DIR}/bin/setup ${DIR}/bin/control bin/ 
	cp -r ${DIR}/metadata $RUNTIME/
	cp -r ${DIR}/env ${DIR}/hooks $RUNTIME/
	cd $RUNTIME
	mv karaf/* $RUNTIME
	rmdir $RUNTIME/karaf
}

appendTemplate() {
	cd $RUNTIME
	git clone https://github.com/Dexels/navajo.template.git template.git --bare
	touch template.git/refs/heads/.gitignore
	touch template.git/refs/tags/.gitignore
	touch template.git/branches/.gitignore
}
 
appendTemplateGit() {
	cd $RUNTIME
	git clone https://github.com/Dexels/navajo.template.git template
	rm -rf $RUNTIME/template.git
}
 
pushDeployedRepo() {
	cd $RUNTIME
	git init
	git add *
	git commit -a -m "initial"
	git remote add origin git@github.com:Dexels/navajo.karaf.cartridge.git
	git push origin master -f
}


downloadKaraf
installKaraf
appendTemplate
pushDeployedRepo
