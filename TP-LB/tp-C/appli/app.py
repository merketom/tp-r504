from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    hostname = os.environ.get("HOSTNAME")
    return f"Réponse du conteneur : {hostname}"

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")

