cp be-quick-or-be-dead-1 patched
python -c "import sys; sys.stdout.write('\x7a\x96\xea\xdf' + '\x90' * 13)" | dd bs=1 seek=$((0x70d)) of=patched conv=notrunc 2> /dev/null

./patched | tail -n 1
