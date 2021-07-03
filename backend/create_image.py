#!/bin/python3

import cgi
import subprocess

print("content-type: text/html")
print()

field = cgi.FieldStorage()
url = field.getvalue("url")
imgName = field.getValue("img")
tagName = field.getvalue("tag")

subprocess.run("sudo wget " + url)
build = subprocess.getoutput(
    "sudo docker build -t {0} . && sudo docker tag {0} {1}".format(imgName, tagName))
print(build)
