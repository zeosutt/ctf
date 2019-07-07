import qrcode

qr = qrcode.QRCode(
   version=1,
   box_size=2,
   border=115
)
qr.add_data('a')
qr.make()
img = qr.make_image()
img.save('./a.png')

qr = qrcode.QRCode(
   version=1,
   box_size=2,
   border=115
)
qr.add_data('b')
qr.make()
img = qr.make_image()
img.save('./b.png')

qr = qrcode.QRCode(
   version=1,
   box_size=2,
   border=115
)
qr.add_data('c')
qr.make()
img = qr.make_image()
img.save('./c.png')
