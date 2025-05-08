from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Flask Hello world! hehehe"

@app.route('/iris')
def test():
    return "hafsa heather iris hannibal dante dennis hehehe"

if __name__ == '__main__':
    app.run(debug=False,host='0.0.0.0', port=5000)