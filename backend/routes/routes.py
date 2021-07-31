from flask import Flask, request, jsonify

from controllers import authController, receiptController, storeController, userController
import json
import functools
import bcrypt


app = Flask(__name__)


def auth_required(func):
    @functools.wraps(func)
    def check_auth(*args, **kwargs):
        if False:
            return jsonify({"message": "Not Authorized"}), 401
        return func(*args, **kwargs)

    return check_auth


@app.route("/", methods=["GET"])
def index():
    return "Welcome to ReceiptHub API1!"


@app.route("/receipt", methods=["POST", "GET"])
@auth_required
def receipts():
    if request.method == "POST":
        return receiptController.create_receipt(request.json)
    else:
        return receiptController.get_receipts_for_user(request.json["user_id"])
    return


@app.route("/receipt/save", methods=["POST"])
@auth_required
def receiptSave():
    if request.method == "POST":
        return receiptController.save_receipt_for_user(request.json["user_id"], request.json["receipt_id"])


@app.route("/store", methods=["POST", "GET"])
@auth_required
def stores():
    if request.method == "POST":
        storeController.create_store(request.json)
    # else:
    #    return storeController.get_store_id(store_id)
    return


@app.route("/register", methods=["POST"])
@auth_required
def registers():
    if request.method == "POST":
        if userController.users:
            if not userController.users.find_one({"email": request.json["email"]}):
                return userController.create_user(request.json)
            else:
                return jsonify({"message": "Email already Exists!"}), 404
        else:
            return userController.create_user(request.json)
    return


@app.route("/login", methods=["POST"])
@auth_required
def logins():
    if request.method == "POST":
        login_user = userController.users.find_one(
            {"email": request.json["email"]})
        print(login_user, dir(login_user))
        return {"uid": str(login_user['_id'])}, 200
        # if bcrypt.hashpw(request.json['password'],  login_user['password']) == login_user('password').encode('utf-8'):
        #     return "Approved!"  # Somehow move user to different endpoint

    return jsonify({"message": "Invalid Username/Password!"}), 400
