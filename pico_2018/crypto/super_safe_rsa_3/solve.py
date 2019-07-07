from operator import mul
from Crypto.Util.number import *

c = 1609479775470056883758973494495300708486154560449085722094584491866466519153733383469638526019826318463331843946407447512206459861663906468281073510987186442362530781711777225999477064729716656111166695258346852136837478106922757569540072599254287609869876180729981656286365340823119184174949278391402008
ps = [2235424417, 2342911091, 2364243289, 2398248883, 2434676857, 2493730819, 2506030867, 2532359737, 2534067139, 2579573371, 2726151497, 2910490741, 2962157699, 3017521561, 3018902461, 3127228597, 3235266469, 3257970301, 3281415409, 3290257849, 3381768899, 3406413623, 3418245773, 3454412557, 3484862921, 3503703089, 3664559551, 3762378107, 3863581067, 3878133617, 4192197811, 4275301873]
e = 65537

n = reduce(mul, ps)
phi = reduce(mul, map(lambda x: x - 1, ps))

d = inverse(e, phi)

print(long_to_bytes(pow(c, d, n)))
