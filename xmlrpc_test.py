import xmlrpclib
import sys
import os

if __name__ == "__main__":
   ip=sys.argv[1]
   port=sys.argv[2]
   rpc_server = xmlrpclib.ServerProxy(str("http://"+ip+":"+port))
   print rpc_server.system.listMethods()
