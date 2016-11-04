#!/usr/bin/python
import sys
if sys.version[0] == "2":
    from urllib import urlopen
else:
    from urllib.request import urlopen
import sys
import json


def ipv4():
	res = urlopen('http://v4.ipv6-test.com/api/myip.php')
	ip = res.read()
	print(ip.decode())

def ipv6():
	res = urlopen("http://v6.ipv6-test.com/api/myip.php")
	ip = res.read()
	print(ip.decode())

def india_time():
	pass

def weather():
	# Weather in Cincinnati OH
	req = urlopen('''https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202459115&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys''')
	res = json.loads(req.read().decode())
	temp = (int(res['query']['results']['channel']['item']['condition']['temp']) - 32)*(0.55555555555)
	print(str(int(temp))+" C",",",res['query']['results']['channel']['item']['condition']['text'])

if __name__=="__main__":
	# Usage
	#print("Usage ...")
	#print("tools.py {ip4 | ip6 | temp}")

	# This map holds a map from args to function
	fun_map = {
	"ip4":ipv4,
	"ip6":ipv6,
	"temp":weather
	}
	# Get the function that should be executed
	cmd = sys.argv[1]
	if cmd in fun_map:
		fun_map[cmd]()
