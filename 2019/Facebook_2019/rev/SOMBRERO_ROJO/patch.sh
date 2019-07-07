cp sombrero_rojo sombrero_rojo_patched
python -c "import sys; sys.stdout.write('\x90' * 5)" | dd bs=1 seek=$((0x60c)) of=sombrero_rojo_patched conv=notrunc 2> /dev/null
