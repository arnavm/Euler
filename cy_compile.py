#!/usr/bin/env python

import os, sys, shutil, subprocess

assert len(sys.argv) == 2, "usage: cy_compile.py <file>"

phile = sys.argv[1]

f = open('setup.py', 'w')
print >> f, "from distutils.core import setup"
print >> f, "from distutils.extension import Extension"
print >> f, "from Cython.Distutils import build_ext"
print >> f, "setup(cmdclass = {'build_ext': build_ext}, ext_modules = [Extension('%s', ['%s'])])" % (phile[:-4], phile)
f.close()

call = "CC=/usr/bin/gcc-4.0 python setup.py build_ext --inplace"
subprocess.call(call, shell = True)

shutil.rmtree('build')
os.remove(phile[:-4] + '.c')
os.remove('setup.py')

print '\n'
call = 'python -c "import %s"' % phile[:-4]
subprocess.call(call, shell = True)

os.remove(phile[:-4] + '.so')