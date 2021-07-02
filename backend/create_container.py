#!/bin/python3

import cgi
import subprocess

print("content-type: text/html")
print()

field = cgi.FieldStorage()
osname = field.getvalue("os")
imageName = field.getvalue("image")
fromPort = field.getvalue("from")
toPort = field.getValue("to")

output = subprocess.getoutput(
    "sudo docker run -it --name " + osname + imageName + "-p " + fromPort + ":" + toPort)
print(output)
