from mininet.topo import Topo

class P2(Topo):

    def __init__(self):
        
        Topo.__init__(self)

        h3 = self.addHost('h3', ip='10.0.0.3',cpu=.01)
        h4 = self.addHost('h4', ip='10.0.0.4', cpu=.01)

        s3 = self.addSwitch('s3')
        s4 = self.addSwitch('s4')

        self.addLink(s3, h3) #Edge: 1
        self.addLink(s4, h4) #Edge: 2

topos = {'p2': (lambda: P2() ) }
