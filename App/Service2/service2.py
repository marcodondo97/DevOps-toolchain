from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def service2():
    return jsonify({'message': 'Response from service 2!'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)
