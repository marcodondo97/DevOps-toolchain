from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route('/')
def home():
    return "PONG"
  
@app.route('/service1', methods=['GET'])
def microservice1():
    response = requests.get('http://localhost:5001')
    data = response.json()
    return jsonify(data)

@app.route('/service2', methods=['GET'])
def microservice2():
    response = requests.get('http://localhost:5002')
    data = response.json()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
