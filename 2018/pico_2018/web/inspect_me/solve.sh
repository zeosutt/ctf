curl -s http://2018shell1.picoctf.com:56252/{,mycss.css,myjs.js} | grep -Po '(?<=flag: ).*?(?= )' | tr -d '\n'
