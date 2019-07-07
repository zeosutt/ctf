wget -q https://katsudon.quals.beginners.seccon.jp/flag -O - | grep -Po ".*(?=--)" | base64 -d | grep -o ctf4b{.*}
