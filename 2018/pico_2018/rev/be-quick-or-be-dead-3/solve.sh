gcc -o calc calc.c

cp be-quick-or-be-dead-3 patched
python -c "import sys; sys.stdout.write('$(./calc)' + '\x90' * 5)" | dd bs=1 seek=$((0x824)) of=patched conv=notrunc 2> /dev/null 

./patched | tail -n 1
