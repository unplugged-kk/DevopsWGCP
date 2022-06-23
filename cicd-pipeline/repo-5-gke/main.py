from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return 'Welcome to Python Flask World v3.0 via ci/cd pipeline GKE deploy'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
