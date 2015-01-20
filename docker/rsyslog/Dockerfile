FROM ubuntu:14.04
RUN apt-get update -q
RUN apt-get -qy install rsyslog dnsutils
CMD rsyslogd -n
VOLUME /dev
VOLUME /var/log
