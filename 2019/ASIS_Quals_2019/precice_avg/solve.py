from pwn import *

context.log_level = 'debug'

target = ELF('./precise_avg.elf')

r = process('./precise_avg.elf')

r.sendlineafter('Number of values: ', '3')

r.send('')
pause()
r.clean()
r.send('')
pause()
r.clean()
r.send('')
r.clean()
r.clean()
pause()
r.clean()
r.send('')
r.clean()
pause()
r.clean()
r.send('')
r.clean()
pause()
r.send('')
pause()
r.clean()
r.send('')
r.clean()
pause()
r.clean()
r.send('')
r.clean()
pause()
r.clean()
r.send('')
r.clean()
# r.send('\x04')

r.interactive()
