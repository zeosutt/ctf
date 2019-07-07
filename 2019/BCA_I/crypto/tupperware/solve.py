from Crypto.Util.number import long_to_bytes

n = 4858487703217654168507377105634002647731128499307244851441090357865711033443419793531999883261579086703285988550325970512343063312965327580978241840458705778582504607655879151828149694589867198840959598497597989866084694560490675801786347730851438931275584908138190409481880911319491978644808036817873514056590135331578105862821454454617375919870245363440066372700053263362863694129133765441926533609503994018565319382913454161429058505655350780911229203432392967236137647780308966936691439636980058266693498568235464310907628785433105091526639
# n = 774507843650191960546369696418619902396162681222261254812863120973331903944431658461979895307122443281250755388223492828366501404904404205480351002783150929153914332481409078882217391135001944658211318108974651660463047116290558871638187108377401391881967943270873650483322319674715762576886344144408339559475551623079564142008840180873166893012951596276114518205014070359136568488623268841371996430655825604744989539759836467627779133692866376679615686821679095685658799263559535618793470370951707040760959440177819912467340791556369375343

# print(hex(n))
print(long_to_bytes(n))
print(n)
print(~n)
# print('A' * 0x1c)
# print(long_to_bytes(1 << 226 * 8))
print(long_to_bytes((1 << 226 * 8) - n))
# print(''.join([chr(ord(ch) ^ 0x00) for ch in long_to_bytes(n)]))
# print(long_to_bytes(4858487703217654168507377105634002647731128499307244851441090357865711033443419793531999883261579086703285988550325970512343063312965327580978241840458705778582504607655879151828149694589867198840959598497597989866084694560490675801786347730851438931275584908138190409481880911319491978644808036817873514056590135331578105862821454454617375919870245363440066372700053263362863694129133765441926533609503994018565319382913454161429058505655350780911229203432392967236137647780308966936691439636980058266693498568235464310907628785433105091526639))


# print(hex(n))