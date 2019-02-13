from os import listdir, getcwd, path
from os.path import isfile, join, islink
from polar import get_import_export_radare, config
import multiprocessing as mp

cwd = getcwd()
config.DATABASE_URL = "bolt://neo4j:test@neo4j:7687"

directories = ['data/lib/',
               'data/sbin/',
               'data/usr/bin/', 
               'data/usr/lib/', 
               'data/usr/sbin/']

files = []
for directory in directories:
    onlyfiles = [f for f in listdir(directory) if isfile(join(directory, f)) and not islink(join(directory, f))]
    for file in onlyfiles:
        files.append(path.join(cwd, directory, file))

cpus = mp.cpu_count()
print("Analysing %d files using %d CPUs" % (len(files), cpus))
pl = mp.Pool(processes=cpus)
results = pl.map(get_import_export_radare, files)
