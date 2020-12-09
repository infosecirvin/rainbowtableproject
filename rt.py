#with help from Vinay Venkat
#pip3 install flask flask-wtf waitress
from flask import render_template, Flask, redirect, flash, url_for, Response
import flask
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
from waitress import serve
from flask_executor import Executor
from flask_shell2http import Shell2HTTP
import time
import subprocess
import re
import select
import html

class vars:
    cache_dict = {}
    last_time = int(time.time())

app = Flask(__name__)
executor = Executor(app)
shell2http = Shell2HTTP(app=app, executor=executor, base_url_prefix="/rainbow/cmd/")
shell2http.register_command(endpoint="rcrack", command_name="./lookup.sh", decorators=[])
SECRET_KEY = "CSRF"
app.config['SECRET_KEY'] = SECRET_KEY

class HashForm(FlaskForm):
    hash = StringField('Hash', validators=[DataRequired()])
    submit = SubmitField('Lookup')

@app.route('/rainbow', methods=['GET', 'POST'])
def lookup():
    return render_template('lookup.html', title="Hash Lookup")


serve(app, host='0.0.0.0', port=3000)
