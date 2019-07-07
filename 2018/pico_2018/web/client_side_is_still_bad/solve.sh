curl -s http://2018shell1.picoctf.com:55790/ | grep -Po "(?<=').*(?=')" | tac | tr -d '\n'
