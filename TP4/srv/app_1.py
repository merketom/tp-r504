from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route('/')
def index():
    db_config = {
        'host': 'tp4-sql',
        'user': 'root',
        'password': 'foo',
        'database': 'tp4'
    }

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    query = "SELECT * FROM test"
    cursor.execute(query)
    data = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('index.html', data=data)

