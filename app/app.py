import os
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(message="Internship DevOps App is running")

@app.route("/healthz")
def health():
    try:
        conn = psycopg2.connect(os.environ["DATABASE_URL"])
        cur = conn.cursor()
        cur.execute("SELECT 1")
        cur.close()
        conn.close()

        app.logger.info("PostgreSQL connection successful")
        return jsonify(status="healthy", database="connected"), 200

    except Exception as e:
        app.logger.error("PostgreSQL connection failed: %s", e)
        return jsonify(status="unhealthy", database="disconnected"), 503

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
