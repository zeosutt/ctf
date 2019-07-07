from pwn import *

r = process('./turtles', env={'LD_PRELOAD': './libs/libgnustep-base.so.1.25:./libs/libicui18n.so.52:./libs/libicuuc.so.52:./libs/libicudata.so.52'})



r.interactive()
