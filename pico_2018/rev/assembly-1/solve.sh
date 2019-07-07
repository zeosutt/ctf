tmpfile=$(mktemp /tmp/XXX.s)
sed 's/.bits/#/' eq_asm_rev.S > $tmpfile
gcc solve.c $tmpfile -o solve -m32 -fno-pie

./solve
