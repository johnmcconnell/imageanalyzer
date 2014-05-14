import os
import sys

## INPUTS
## 1 - source file
## 2 - dest file
##
## the source file is stripped down and checked whether or not it contains
## useful data, if so the semi-formatted data is written to the dest file

if len(sys.argv) > 2:
	src = sys.argv[1]
	dst = sys.argv[2]
	size = os.path.getsize(src)
	if(size > 3):
		print "opening " + src + " for reading"
		srcf = open(src)
		dstf = open(dst, 'w')
		for line in srcf:
			line = line.translate(None, "\n, ")
			if len(line) > 3:
				dstf.write(line + "\n")
				print "writing " + line + " to " + dst
else:
	print "NEED 2 ARGS - SRC , DST"	

			