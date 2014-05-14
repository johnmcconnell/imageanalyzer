import os
from os.path import isfile, join

direct = os.getcwd()
printing = 1
good_files = []

mypath = direct+"/../images/results"
for i in [ f for f in os.listdir(mypath) if isfile(join(mypath,f)) ]:
	size = os.path.getsize(mypath + "/" + i)
	if(size > 5):
		f = open(mypath + "/" + i)
		goodfile = 0
		for line in f:
			line = line.translate(None, "\n")
			line = line.translate(None, " ")
			if len(line) > 3:
				goodfile = 1
				#print line
		if goodfile == 1:
			good_files.append(i)
			goodfile = 0
print good_files