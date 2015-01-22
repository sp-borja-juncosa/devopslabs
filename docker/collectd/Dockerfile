FROM ubuntu:trusty
MAINTAINER Borja Juncosa <borja.juncosa@socialpoint.es>

ENV TMP_PACKAGES="build-essential wget librrd-dev"

WORKDIR /usr/src
RUN apt-get update && \
    apt-get install -y $TMP_PACKAGES && \
    wget https://collectd.org/files/collectd-5.4.1.tar.gz && \
    tar xzf collectd-5.4.1.tar.gz && \
    cd collectd-5.4.1 && \
    ./configure --prefix=/usr/local --disable-daemon --disable-all-plugins \
      --enable-exec --enable-network --enable-rrdtool --enable-syslog && \
    make && \
    make install && \
    mkdir -p /var/lib/collectd/rrd && \
    apt-get remove -y --purge $TMP_PACKAGES && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /usr/src/collectd*

RUN apt-get install -y rrdtool

ADD collectd.conf /etc/collectd/

EXPOSE 25826/udp

VOLUME [ "/var/lib/collectd/rrd" ]

CMD ["/usr/local/sbin/collectd", "-C", "/etc/collectd/collectd.conf"]
