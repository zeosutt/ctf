import pyshark

f_sent = open('sent_data', 'w')
f_rcvd = open('rcvd_data', 'w')
f_rcvd_45 = open('rcvd_data_45', 'w')

packets = pyshark.FileCapture('./ev3_scanner_record.pklg')

for i, packet in enumerate(packets):
	if 'data' in packet:
		if int(packet.packetlogger.type, 16) == 2:
			f_sent.write('{:5d}: {}\n'.format(i, packet.data.data))
		if int(packet.packetlogger.type, 16) == 3:
			# if len(packet.data.data) > 10:
				# f_rcvd.write(' ' if str(packet.data.data) == '07002a00020000c040' else 'X')
			f_rcvd.write('{:5d}: {}\n'.format(i, packet.data.data))
			if packet.data.data[-2:] == '45' or packet.data.data[-2:] == '44':
				f_rcvd_45.write('{:5d}: {}\n'.format(i, packet.data.data))
