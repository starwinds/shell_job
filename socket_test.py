import socket
import sys
import os

if __name__ == "__main__":
   ip=sys.argv[1]
   port=sys.argv[2]
   s = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
   s.connect((ip,int(port)))
   print s
   s.send("GET / HTTP/1.1")

   d = s.recv(1024)
   print d
   s.close()
