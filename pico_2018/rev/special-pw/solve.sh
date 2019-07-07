# tmpfile=$(mktemp /tmp/XXX.s)
# sed 's/\(.bits\|;\|^[0-9A-F]\+:\)/#/' special_pw.S > $tmpfile
# gcc $tmpfile -o auth -m32

gcc -o solve solve.c
./solve
