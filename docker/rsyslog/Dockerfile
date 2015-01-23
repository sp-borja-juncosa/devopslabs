FROM ubuntu:14.04
RUN apt-get update -q
RUN apt-get -qy install rsyslog dnsutils
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD rsyslogd -n
VOLUME /dev
VOLUME /var/log
