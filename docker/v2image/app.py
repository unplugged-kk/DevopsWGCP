from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return 'Welcome to DevopsWGCP learning By Kishore GCR image v2.O'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
