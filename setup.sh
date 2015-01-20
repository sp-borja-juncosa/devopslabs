#!/bin/bash

RELATIVE_BASEDIR=$(dirname $0)

cd $RELATIVE_BASEDIR
BASEDIR=$(pwd)

echo "Sharing $BASEDIR with the virtual machine"
sed "s:BASE_SYNC_FOLDER:${BASEDIR}:g" vagrant/Vagrantfile.template > vagrant/Vagrantfile

