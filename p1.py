from mininet.topo import Topo

class P1(Topo):

    def __init__(self):
        
        Topo.__init__(self)

        h1 = self.addHost('h1', ip='10.0.0.1',cpu=.01)
        h2 = self.addHost('h2', ip='10.0.0.2', cpu=.01)

        s1 = self.addSwitch('s1')
        s2 = self.addSwitch('s2')

        self.addLink(s1, h1) #Edge: 1
        self.addLink(s2, h2) #Edge: 2

topos = {'p1': (lambda: P1() ) }
