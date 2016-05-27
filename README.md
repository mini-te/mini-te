# Mini-TE

Mini-TE: A Distributed Framework for Traffic Engineering of SDN Data Paths.

This tutorial describes how to install a complete
environment for OpenFlow 1.3 experiments in an emulated
network with Mininet.
We evaluate the communication between Mininets in
separated physical hosts with Open vSwitch 2.5.0,
DB Schema 7.12.1, and dpctl 1.3. 

Part I: How to start?
=====================

* Mininet must be installed on each Virtual Machine:

```
# git clone https://github.com/mininet/mininet.git
# ./mininet/util/install.sh -n3fxw
# apt-get update
# apt-get install openvswitch-common openvswitch-controller openvswitch-switch 
```

Now, we set-up GRE tunnels between two Virtual Machines(VM).

We start our environment on VM1 as follows:

```
# cd mini-te
# ./iniciar_mininet.sh
# mn --custom p1.py --topo p1 --switch ovsk
mininet> h1 xterm&
   # ./p1.tuneis
```

And, outside Mininet environment of VM1:
```
# ./p1_regras.sh
```

Note that you may look OpenFlow port status with
the following command:
```
# netstat -tlnp
```

We also provide a script to setup (many) GRE tunnels
to a single switch, in order to evaluate that there
is no significative impact in set many concurrent
tunnels in the same virtual switch.
```
# ./setup_gre_tun.sh
```

Two files (add_gre_tun.sh and del_gre_tun.sh) will be
created, one to add and other to remove the tunnels,
respectively. You can add and remove tunnels as follows,
but outside Mininet environment:
```
# ./add_gre_tun.sh
# ./del_gre_tun.sh
```

Part 2:
=======

Manage OpenFlow rules with MilpFlow project at: https://github.com/milpflow/milpflow


Other useful commands:
======================

Some useful commands to update this repository:

* git config --global user.email "email at email"

* git add .

* git commit "Changes"

* git push origin master