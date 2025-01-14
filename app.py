from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Hello, world! This app is running as a non-root user with a read-only filesystem."})

@app.route("/health")
def health_check():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    # Ensure the app runs on port 8000 (as exposed in the Dockerfile
