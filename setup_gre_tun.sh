#!/bin/bash

#Useful commands: 
#ovs-vsctl show
#ovs-vsctl list-br
#ovs-vsctl add-br s1
#ovs-vsctl del-br s1
#ovs-vsctl list-ports s1

A=1000						# Set amount tunnels
SWITCH=1
REMOTE_IP="192.168.0.2"						# Remote IP
         
B=$A                                                            # Add script file
echo "#!/bin/bash" > ~/add_gre_tun.sh		                # Clear file
I=1
while [ $I -le $A ]; do						# loop
   echo "echo \"Add GRE tunnel #"$I\" >> ~/add_gre_tun.sh
   echo "ovs-vsctl add-port s$SWITCH s$SWITCH-gre$I \
-- set interface s$SWITCH-gre$I \
type=gre options:remote_ip=$REMOTE_IP \
options:key=$I" >> ~/add_gre_tun.sh                             # Create Tunnels
   I=$(($I+1))
done
echo "ovs-vsctl show" >> ~/add_gre_tun.sh                       # Show gre port info
chmod +x ~/add_gre_tun.sh
                                                                # Delete script file
echo "#!/bin/bash" > ~/del_gre_tun.sh		                # Clear file
I=1
while [ $I -le $B ]; do					        # loop
   echo "echo \"Delete GRE tunnel #"$I\" >> ~/del_gre_tun.sh
   echo "ovs-vsctl del-port s$SWITCH-gre$I \
" >> ~/del_gre_tun.sh                             # Create Tunnels
   I=$(($I+1))
done
echo "ovs-vsctl show" >> ~/del_gre_tun.sh                       # Show gre port info
chmod +x ~/del_gre_tun.sh
