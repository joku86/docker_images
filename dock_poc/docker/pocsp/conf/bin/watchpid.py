#!/usr/bin/env python

# """ An executable which proxies for a subprocess; upon a signal, it sends that
# signal to the process identified by a pidfile. """

import os
import subprocess
import sys
import signal
import time

class PidProxy:
    
    def __init__(self, args):
        try:
            self.pidfile, self.cmdargs = args[1], args[2:] 
        except (ValueError, IndexError):
            self.usage()
            sys.exit(1)

    def go(self):
        subprocess.call(self.cmdargs)
        try:
            with open(self.pidfile, 'r') as f:
            	pid = int(f.read().strip())
            # pid, sts = os.waitpid(pid, 0)
            self.setsignals()
            while 1:
                time.sleep(2)
                os.kill(pid, 0)
                                 
        except Exception as ex:
            print ex
            

    def usage(self):
        print("pidproxy.py <pidfile name> <command> [<cmdarg1> ...]")

    def setsignals(self):
        signal.signal(signal.SIGTERM, self.passtochild)
        signal.signal(signal.SIGHUP, self.passtochild)
        signal.signal(signal.SIGINT, self.passtochild)
        signal.signal(signal.SIGUSR1, self.passtochild)
        signal.signal(signal.SIGUSR2, self.passtochild)
        signal.signal(signal.SIGQUIT, self.passtochild)
        signal.signal(signal.SIGCHLD, self.reap)

    def reap(self, sig, frame):
        pass

    def passtochild(self, sig, frame):
        try:
            with open(self.pidfile, 'r') as f:
                pid = int(f.read().strip())
        except:
            print("Can't read  pidfile %s!" % self.pidfile)
            return
        
        if sig in [signal.SIGTERM, signal.SIGINT, signal.SIGQUIT]:
            os.kill(pid, signal.SIGTERM)
            sys.exit(0)

def main():
    pp = PidProxy(sys.argv)
    pp.go()

if __name__ == '__main__':
    main()
