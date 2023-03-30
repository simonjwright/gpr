import os
import subprocess

# GPRbuild
subprocess.run("gprbuild -p -q libtst.gpr", shell=True)

# GPRinstall
subprocess.run("gprinstall --prefix=install -p libtst.gpr", shell=True)
subprocess.run("gprinstall --prefix=installm -m -p libtst.gpr", shell=True)

# Test installation
subprocess.run("gprbuild -q -f -aPinstall/share/gpr use/usel.gpr", shell=True)
subprocess.run("./use/obj/main", shell=True)

subprocess.run("gprbuild -q -f -aPinstallm/share/gpr use/usel.gpr", shell=True)
subprocess.run("./use/obj/main", shell=True)
