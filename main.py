#with help from Vinay Venkat
#pip3 install flask flask-wtf
from flask import render_template, Flask, redirect, flash
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
import subprocess

app = Flask(__name__)
SECRET_KEY = "CSRF"
app.config['SECRET_KEY'] = SECRET_KEY
app.config['value']=''


class HashForm(FlaskForm):
    hash = StringField('Hash', validators=[DataRequired()])
    submit = SubmitField('Lookup')

@app.route('/lookup', methods=['GET', 'POST'])
def lookup():
    form = HashForm()
    if form.validate_on_submit():
        hash = form.hash.data
        process = subprocess.Popen(["./rt.sh","-a", hash], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        app.config['value'], err = process.communicate()
        flash('Lookup requested for hash {}'.format(hash))
        redirect('/lookup')
    print(app.config['value'])
    return render_template('lookup.html', title=app.config['value'], form=form)

app.run(host='0.0.0.0', port=3000)
