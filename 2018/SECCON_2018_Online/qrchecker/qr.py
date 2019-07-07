#!/usr/bin/env python3
import sys, io, cgi, os
from PIL import Image
import zbarlight
# print("Content-Type: text/html")
# print("")
codes = set()
sizes = [500, 250, 100, 50]
# print('<html><body>')
# print('<form action="' + os.path.basename(__file__) + '" method="post" enctype="multipart/form-data">')
# print('<input type="file" name="uploadFile"/>')
# print('<input type="submit" value="submit"/>')
# print('</form>')
# print('<pre>')
try:
    # form = cgi.FieldStorage()
    # data = form["uploadFile"].file.read(1024 * 256)
    data = open('./bc.png', 'rb').read(1024 * 256)
    image= Image.open(io.BytesIO(data))
    # result= zbarlight.scan_codes('qrcode', image)
    # print(result)
    image.show()
    for sz in sizes:
        print(sz)
        image = image.resize((sz, sz))
        image.show()
        result= zbarlight.scan_codes('qrcode', image)
        print(result)
        if result == None:
            break
        if 1 < len(result):
            break
        codes.add(result[0])
        print(codes)
    for c in sorted(list(codes)):
        print(c.decode())
    if 1 < len(codes):
        print("SECCON{" + open("flag").read().rstrip() + "}")
except:
    print('oh my god')
    pass
# print('</pre>')
# print('</body></html>')
