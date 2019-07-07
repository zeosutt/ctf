cp imageprot imageprot_patched
python -c "import sys; sys.stdout.write('A' * 16)" | dd bs=1 seek=$((0x2bf090)) of=imageprot_patched conv=notrunc 2> /dev/null
python -c "import sys; sys.stdout.write('A' * 28)" | dd bs=1 seek=$((0x2d4c43)) of=imageprot_patched conv=notrunc 2> /dev/null
python -c "import sys, base64; from pwn import *; sys.stdout.write(base64.b64encode(xor('http://example.com/////////////////////////', '1337')))" | dd bs=1 seek=$((0x2d4c5f)) of=imageprot_patched conv=notrunc 2> /dev/null

echo '
break *0x555555554000 + 0x56f51
r
set $start_addr = *(char **)($rsp+0x4a8-0x438)
set $end_addr = $start_addr + *(int *)($rsp+0x4a8-0x428)
dump binary memory flag.jpg $start_addr $end_addr
q
' > .gdbinit

gdb imageprot_patched > /dev/null 2>&1
