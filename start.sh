#!/bin/bash

WORKDIR=$(dirname $0)
$WORKDIR/setup.sh

cd $WORKDIR/vagrant
vagrant up
