#!/usr/bin/python3
import sys
import base64

def encode(filename):
    with open(filename, "r") as f:
        s = f.readline().strip()
        s = base64.b64decode(s[:len(s)//5][::-1].encode('utf-8')).decode('utf-8')
        return ''.join([chr(ord(s[x])-([5,-1,3,-3,2,15,-6,3,9,1,-3,-5,3,-15] * 3)[x]) for x in range(len(s))])

if __name__ == "__main__":
    print(encode(sys.argv[1]))
