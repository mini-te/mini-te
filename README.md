# Mini-TE

Mini-TE: A Distributed Framework for Traffic Engineering of SDN Data Paths.

This tutorial describes how to install a complete
environment for OpenFlow 1.3 experiments in an emulated
network with Mininet.
We evaluate the communication between Mininets in
separated physical hosts with Open vSwitch 2.5.0,
DB Schema 7.12.1, and dpctl 1.3. 

How to start?
=============

* Mininet must be installed on each Virtual Machine:

```
# git clone https://github.com/mininet/mininet.git
# ./mininet/util/install.sh -n3fxw
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

Other useful commands:
======================

Some useful commands to update this repository:

* git config --global user.email "email at email"

* git add .

* git commit "Changes"

* git push origin master