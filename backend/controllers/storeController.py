import pymongo
from db import db
import json
from flask import jsonify

stores = db.stores

def get_store_id(store_id):
    string_store_id = str(store_id)
    find_store = {"store_id": string_store_id}

    output = store_id.find(find_store, {{ "store_id": 1, "store_name": 0, "store_location": 0 }})
    return jsonify({"message": str(output)}),200



# POST /store
def create_store(store_data):
    store_id = stores.insert_one(
        {
            "store": {
                
                "store_name": store_data["store"]["name"],
                "store_location": store_data["store"]["location"]
            },
        }
    )
    store_id = str(store_id.inserted_id)
    return (
        jsonify(
            {
                "message": "Successfully created Store",
                "data": {"store_id": store_id},
            }
        ),
        200,
    )