import struct
from PIL import Image

with open('./flag', 'wb') as f:
	im = Image.open('./favicon_frame_0001.bmp')
	for pixel in im.getdata():
		f.write(b''.join([struct.pack('B', val) for val in pixel]))

	i = 2
	while True:
		try:
			im = Image.open('./favicon_frame_{:04d}.bmp'.format(i))
		except FileNotFoundError:
			break

		for pixel in list(im.getdata())[15*16:]:
			f.write(b''.join([struct.pack('B', val) for val in pixel]))

		i += 1
