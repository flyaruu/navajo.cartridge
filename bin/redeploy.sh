#!/bin/sh
export KARAFBIN="../runtime/karaf/bin/"
echo "Cleaning repo feature cache"
rm -rf ~/.m2/repository/com/dexels/navajo/com.dexels.navajo.karaf.feature/*

if [ -d $KARAFBIN ];
then
   echo "File exists."
   cd $KARAFBIN
   ./stop
   cd -
else
   echo "File does not exist."
fi
./clean.sh
./deploy.sh
cd $KARAFBIN
echo "Starting Karaf"
./start
echo "Sleeping 20s"
sleep 20
./client

