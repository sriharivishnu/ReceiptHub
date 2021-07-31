import pymongo
from db import db
import json
from flask import jsonify, request
from bson.json_util import dumps
from bson.json_util import loads

receipts = db.receipts


def get_receipts_for_user(user_id):
    payload = []
    for receipt in payload[user_id]:
        payload.append(receipt)
    return jsonify({"data": payload})


def save_receipt_for_user(user_id, receipt_id):
    get_receipt = loads(dumps(receipts.find_one({"_id": receipt_id})))
    receipts[user_id].insert_one({
        "receipt_id": receipt_id,
        **get_receipt
    })
    return jsonify({"message": "Saved Receipt!"})


# POST /receipt
def create_receipt(receipt_data):
    request_id = receipts.insert_one(
        {
            "items": receipt_data["items"],
            "store": {
                "store_id": receipt_data["store"]["id"],
                "store_name": receipt_data["store"]["name"],
                "store_location": receipt_data["store"]["location"],
            },
        }
    )
    request_id = str(request_id.inserted_id)
    return (
        jsonify(
            {
                "message": "Successfully created receipt",
                "data": {"receipt_id": request_id},
            }
        ),
        200,
    )
