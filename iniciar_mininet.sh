#!/bin/bash
#apt-get update
#apt-get install -y git automake autoconf gcc uml-utilities libtool build-essential git pkg-config linux-headers-`uname -r`
#wget http://openvswitch.org/releases/openvswitch-2.3.0.tar.gz
#tar zxvf openvswitch-2.3.0.tar.gz
#cd openvswitch-2.3.0
#./boot.sh
#./configure --with-linux=/lib/modules/`uname -r`/build
#make && make install && make modules_install
modprobe gre
modprobe openvswitch
modprobe libcrc32c
#insmod ./datapath/linux/openvswitch.ko
#mkdir -p /usr/local/etc/openvswitch
ovsdb-tool create /usr/local/etc/openvswitch/conf.db /usr/local/share/openvswitch/vswitch.ovsschema
ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
--remote=db:Open_vSwitch,Open_vSwitch,manager_options \
--private-key=db:Open_vSwitch,SSL,private_key \
--certificate=db:Open_vSwitch,SSL,certificate \
--bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
--pidfile --detach --log-file
ovs-vsctl --no-wait init
ovs-vswitchd --pidfile --detach --log-file
ovs-vsctl show
