from datetime import datetime, timedelta
import jwt
import os

import json


def encode_auth_token(user_id):
    """
    Generates the Auth Token
    :return: string
    """
    print(user_id)
    try:
        payload = {
            "exp": str(datetime.utcnow() + timedelta(days=3, seconds=5)),
            "iat": str(datetime.utcnow()),
            "uid": str(user_id),
        }
        print(payload)
        return json.dumps(jwt.encode(payload, os.environ.get("SECRET_KEY"), algorithm="HS256"))
    except Exception as e:
        print(e)
        return {"message": "Error: " + str(e)}
