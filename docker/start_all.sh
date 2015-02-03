#!/bin/bash

function start_container() {
  CPATH=$1
  CNAME=$2

  retries=10
  retry=0

  cd $CPATH
  while true; do
    echo "Creating $CNAME container ($retry)..."
    fig up -d --no-recreate
    if [ $? -eq 0 ]; then
      break
    else
      retry=$(( $retry + 1 ))
      sleep 1
    fi
    if [ $retry -gt $retries ]; then
      echo "Failed to start $CNAME container. Retried $retries times"
      exit 1
    fi
  done
}

docker ps -qa -f status=exited | xargs docker rm
start_container /usr/src/docker/rsyslog/ rsyslog
cd /usr/src/docker/spbase/
export PUB_IP=$(ifconfig eth0 | awk '/inet addr:/{print substr($2,match($2,":")+1,length($2))}')
sed "s:PUB_IP:$PUB_IP:g" fig_template.yml > fig.yml
start_container /usr/src/docker/spbase/ spbase
start_container /usr/src/docker/collectd/ collectd
start_container /usr/src/docker/visage/ visage
