from flask import Flask, jsonify

app = Flask(__name__)

# Sample data
data = [
    {"id": 1, "name": "John Doe", "age": 30},
    {"id": 2, "name": "Jane Smith", "age": 25}
]

@app.route('/api/users', methods=['GET'])
def get_users():
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
