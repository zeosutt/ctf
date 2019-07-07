from PIL import Image

im = Image.open('./starmap.bmp')

print(filter(lambda ch: ord(ch) > 0, im.tobytes()))
