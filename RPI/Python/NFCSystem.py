import requests
import random
import os

products = requests.get("https://api.datamuse.com/words?rel_jja=berry")

items = []

for words in random.sample(products.json(), 10):
    price = random.randint(1, 100) + 0.99
    item = {"name": words["word"], "price": price}
    items.append(item)

obj = {"items": items, "store": {"id": "12345", "name": "Zehr's", "location": "43.50558471 -80.497627251"}}

response = requests.post('https://receipthub.herokuapp.com/receipt', json=obj)

rid = response.json()["data"]["receipt_id"]

# Constant headers
head = [0xd1, 0x01, 0x00, 0x54]

# Payload Headers
payHead = [0x02, 0x65, 0x6e]

payload = bytearray(rid.encode("utf-8"))

head[2] = len(payHead) + len(payload)

head = bytearray(head)
payHead = bytearray(payHead)

NDEF = head + payHead + payload

newFile = open("NDEF.bin", "wb")
newFile.write(bytearray(NDEF))
newFile.close()

os.system("nfc-emulate-forum-tag4 NDEF.bin")

os.remove("NDEF.bin")
