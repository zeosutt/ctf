import requests

data = {'message': 'zurich'}

r = requests.post('https://bnv.web.ctfcompetition.com/api/search', json=data)

print(r.text)
