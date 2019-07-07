from flask import Flask, session, escape
app = Flask(__name__)
app.secret_key = 'a7a8342f9b41fcb062b13dd1167785f8'

@app.route('/')
def index():
	session['user_id'] = '1'
	return escape(session)
