Requisites
==========

To run this project you will need *virtualbox* and *vagrant*.

* Virtualbox: https://www.virtualbox.org/
* Vagrant: https://www.vagrantup.com/

Setting it up
=============

For the project to run, you should first execute setup.sh which will create the Vagrantfile.

```
 $ ./start.sh
 Sharing <directory_name> with the virtual machine
 ...
```

It takes some time to start all machines, as it has to build some of the images.

Starting all containers
=======================

If you want to start all containers after some has crashed or if you have stopped them, you can use this:

```
 $ ./docker/start_all.sh
 ...
```

Services available
==================

When everything is started you will have some services which you'll be able to access:

* Consul: http://127.0.0.1:8500/ui/dist/#/dc1/services
* Visage: http://127.0.0.1:9292/builder
* Logs:
```
$ docker exec -ti <rsyslog container> /bin/bash
$ tail -f /var/log/syslog
```

