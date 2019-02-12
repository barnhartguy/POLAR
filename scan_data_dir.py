from os import listdir
from os.path import isfile, join, islink
from polar import get_import_export_radare, config

config.DATABASE_URL = "bolt://neo4j:test@neo4j:7687"

directories = ['data/lib/',
               'data/sbin/',
               'data/usr/bin/', 
               'data/usr/lib/', 
               'data/usr/sbin/']

for directory in directories:
	onlyfiles = [f for f in listdir(directory) if isfile(join(directory, f)) and not islink(join(directory, f))]
	for file in onlyfiles:
            print(file)
	    get_import_export_radare(file,directory+file)
