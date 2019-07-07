cp be-quick-or-be-dead-2 patched
python -c "import sys; sys.stdout.write('\x2d\xc3\x3e\xd7' + '\x90' * 5)" | dd bs=1 seek=$((0x7dd)) of=patched conv=notrunc 2> /dev/null 

./patched | tail -n 1
