# $ sshpass -p "i'm a real hacker now" ssh ctf@107.21.60.114
# SuckMORE shell v1.0.1. Note: for POSIX support update to v1.1.0
# suckmore>ls
# suckmore>cat
# touch: missing file operand
# Try 'touch --help' for more information.
# suckmore>pwd
# Linux
# suckmore>cd
#      April 2019
# Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6
#  7  8  9 10 11 12 13
# 14 15 16 17 18 19 20
# 21 22 23 24 25 26 27
# 28 29 30
# suckmore>/bin/sh
# suckmore>ls
# sh: /usr/bin/ls: Permission denied
# suckmore>cat
# sh: /usr/bin/cat: Permission denied
# suckmore>pwd
# /
# suckmore>cd
# suckmore>pwd
# /home/ctf
# suckmore>> a
# suckmore>> flag
# sh: flag: Permission denied
# suckmore>read a < flag
# suckmore>echo $a
# WPI{bash_sucks0194342}

read a < /home/ctf/flag
echo $a
