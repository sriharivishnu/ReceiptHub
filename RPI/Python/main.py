import requests
import random

products = requests.get("https://api.datamuse.com/words?rel_jja=berry")

items = []

for words in random.sample(products.json(), 10):
    x = random.randint(1, 100) + 0.99
    item = {"name": words["word"], "price": x}
    items.append(item)

obj = {}

obj["items"] = items
obj["store"] = {"id": "12345", "name": "Zehr's", "location": "43.50558471 -80.497627251"}

response = requests.post('https://receipthub.herokuapp.com/receipt', json=obj)

id = response.json()["data"]["receipt_id"]
print(id)

