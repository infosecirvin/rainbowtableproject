import subprocess
import os
#the web portion
from flask import Flask

app = Flask(__name__)
@app.route("/")
def rt():
	return "What is the hash?"

if __name__ == "_main_":
	app.run(host='0.0.0.0', port=3000)

#the local portion
#print("Test hash is: B267DF22CB945E3E or pass")
#hash = input("What is the hash?")
#subprocess.call(["./rcracki_mt","-h", hash, "rt/"])

