import bcrypt
import pymongo
from db import db
import json
from flask import jsonify
import bcrypt

from controllers.authController import encode_auth_token
users = db.users


# POST /user
def create_user(user_data):
    user_id = users.insert_one(
        {
            "email":  user_data["email"],
            "password":  bcrypt.hashpw(user_data["password"].encode('utf-8'), bcrypt.gensalt())
        }
    )
    user_id = str(user_id.inserted_id)
    return (
        jsonify(
            {
                "message": "Successfully registered",
                "data": {"token": user_id},
            }
        ),
        200
    )
