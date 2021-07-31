from routes.routes import app
import os

inDev = os.environ.get("ENVIRONMENT", None) == "development"

if inDev:
    import dotenv

    dotenv.load_dotenv(dotenv.find_dotenv(".env"))

if __name__ == "__main__":
    if inDev:
        app.run(host="0.0.0.0", port=5000, debug=True)

    else:
        app.run()
