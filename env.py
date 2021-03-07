#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""General environment utilities."""
from datetime import datetime
import struct
import sys
import platform
import pwd
import time
import os

class Env(object):
    """System environment data"""
    @property
    def archp2(self):
        return platform.architecture()[0]  # Str (not reliable in OSX)
    @property
    def archp(self):
        return ("32bit", "64bit")[(struct.calcsize("P") == 8)]  # Str (for py)
    @property
    def cwd(self):
        return os.getcwd()  # Str
    @property
    def distro(self):
        try:
            return ' '.join(platform.linux_distribution())  # Str
        except AttributeError:
            return ''
    @property
    def ls(self):
        return os.listdir('.')  # List
    @property
    def home(self):
        return os.path.expanduser('~')  # Str
    @property
    def host(self):
        return platform.node()  # Str
    @property
    def mach(self):
        return platform.uname()[-2]  # Str
    @property
    def null(self):
        return '\0'  # Str
    @property
    def nul(self):
        return os.devnull  # Str (location of..)
    @property
    def os_(self):
        return os.uname()  # List
    @property
    def osname(self):
        return os.name.upper()  # Str
    @property
    def ostitl(self):
        return platform.uname()[0].title()  # Str
    @property
    def osver(self):
        return platform.uname()[2][:platform.uname()[2].find('-')].title()  # Str
    @property
    def plat(self):
        return sys.platform.upper()  # Str
    @property
    def proc(self):
        return platform.uname()[-1]  # Str
    @property
    def serr(self):
        return sys.stderr  # File object
    @property
    def sin(self):
        return sys.stdin  # File object
    @property
    def sout(self):
        return sys.stdout  # File object
    @property
    def ctime(self):
        return time.ctime()  # Str
    @property
    def localtime(self):
        return time.localtime()  # Time struct
    @property
    def isotime(self):
        return datetime.isoformat(datetime.today()) # Str
    @property
    def user(self):
        return pwd.getpwuid(os.getuid())[0]  # Str (getlogin can fail)
    @property
    def ver(self):
        return sys.version_info[0:3]  # List (python)
    @property
    def vers(self):
        return '.'.join(str(idx) for idx in self.ver)  # Str (python)

