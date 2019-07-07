# sudo john -wordlist:../../../tool/dict/rockyou.txt shadow

username=$(sudo john -show shadow | head -n 1 | cut -d : -f 1)
password=$(sudo john -show shadow | head -n 1 | cut -d : -f 2)

nc 2018shell1.picoctf.com 5221 <<- EOT | grep -o picoCTF{.*}
	$username
	$password
EOT
