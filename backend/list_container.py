#!/bin/python3

import cgi
import subprocess

print("content-type: text/html")
print()

containers = subprocess.getoutput("sudo docker ps -a")
print(containers)
