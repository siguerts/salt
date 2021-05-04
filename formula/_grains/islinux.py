#!/usr/bin/python3

import platform

def roles():
    grains = {}
    os = platform.system()
    if os == "Linux":
        grains["islinux"] = True
    else:
        grains["islinux"] = False
    return grains
