#!/bin/bash

export RRDDIR=$RRDDIR

visage-app start $* | logger -t visage-app -p local0.info
