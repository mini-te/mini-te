#(1<--) ARP
curl -X POST -d '{"dpid": 1,"match": {"in_port":2, "dl_type":2054, "arp_tpa":"10.0.0.1"}, "actions": [{"type": "OUTPUT", "port": 1}]}' http://192.168.0.1:8080/stats/flowentry/add
#(1<--) IP
curl -X POST -d '{"dpid": 1,"match": {"in_port":2, "dl_type":2048, "nw_dst":"10.0.0.1"}, "actions": [{"type": "OUTPUT", "port": 1}]}' http://192.168.0.1:8080/stats/flowentry/add
#(2-->) ARP
curl -X POST -d '{"dpid": 1,"match": {"in_port":1, "dl_type":2054, "arp_tpa":"10.0.0.2"}, "actions": [{"type": "OUTPUT", "port": 2}]}' http://192.168.0.1:8080/stats/flowentry/add
#(2-->) IP
curl -X POST -d '{"dpid": 1,"match": {"in_port":1, "dl_type":2048, "nw_dst":"10.0.0.2"}, "actions": [{"type": "OUTPUT", "port": 2}]}' http://192.168.0.1:8080/stats/flowentry/add

#(1<--) ARP
curl -X POST -d '{"dpid": 1,"match": {"in_port":1, "dl_type":2054, "arp_tpa":"10.0.0.3"}, "actions": [{"type": "OUTPUT", "port": 3}]}' http://192.168.0.1:8080/stats/flowentry/add
#(1<--) IP
curl -X POST -d '{"dpid": 1,"match": {"in_port":1, "dl_type":2048, "nw_dst":"10.0.0.3"}, "actions": [{"type": "OUTPUT", "port": 3}]}' http://192.168.0.1:8080/stats/flowentry/add
#(2-->) ARP
curl -X POST -d '{"dpid": 1,"match": {"in_port":3, "dl_type":2054, "arp_tpa":"10.0.0.1"}, "actions": [{"type": "OUTPUT", "port": 1}]}' http://192.168.0.1:8080/stats/flowentry/add
#(2-->) IP
curl -X POST -d '{"dpid": 1,"match": {"in_port":3, "dl_type":2048, "nw_dst":"10.0.0.1"}, "actions": [{"type": "OUTPUT", "port": 1}]}' http://192.168.0.1:8080/stats/flowentry/add
