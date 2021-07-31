from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://Receipt_team:Tt5YWqtLay6VhuD@document1.g2yuk.mongodb.net/database?retryWrites=true&w=majority&authSource=admin"
)

db = client["database"]
