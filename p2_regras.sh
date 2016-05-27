#(ARP-->) 
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.2,in_port=1 apply:output=2
#(IP-->) 
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.2,in_port=1 apply:output=2
#(<--ARP) 
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.3,in_port=2 apply:output=1
#(<--IP) 
dpctl tcp:127.0.0.1:6634 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.3,in_port=2 apply:output=1

#(ARP-->) 
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.1,in_port=1 apply:output=2
#(IP-->) 
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.1,in_port=1 apply:output=2
#(<--ARP) 
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add eth_type=0x806,arp_tpa=10.0.0.4,in_port=2 apply:output=1
#(<--IP) 
dpctl tcp:127.0.0.1:6635 flow-mod table=0,cmd=add eth_type=0x800,ip_dst=10.0.0.4,in_port=2 apply:output=1

