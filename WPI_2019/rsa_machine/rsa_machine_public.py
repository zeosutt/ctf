#!/usr/bin/python3

import sys

from Crypto.PublicKey import RSA

def run(inFile, outFile):
    privkey = RSA.generate(2048)
    pubkey = privkey.publickey().exportKey()

    outFile.write(pubkey + b'\n')

    while not outFile.closed:
        outFile.flush()

        line = inFile.readline()
        if not line: #EOF
            break

        line = line.rstrip(b'\n')
        if not line:
            continue

        try:
            [cmd, param] = line.split(maxsplit=1)
        except ValueError:
            outFile.write(b'Parameter required!\n')
            continue

        if cmd == b'sign':
            if param == b'getflag':
                outFile.write(b'No cheating!\n')
            else:
                (signature,) = privkey.sign(param, None)
                outFile.write(str(signature).encode() + b'\n')

        elif cmd == b'getflag':
            signature = int(param)
            if privkey.verify(b'getflag', (signature,)):
                outFile.write(b'[REDACTED]')
                break
            else:
                outFile.write(b'Bad signature!\n')

        else:
            outFile.write(b'Bad command ' + cmd + b'\n')

if __name__ == '__main__':
    run(sys.stdin.buffer, sys.stdout.buffer)
