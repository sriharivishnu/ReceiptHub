import ndef

# Constant headers
arr = [
    0xd1, 0x01, 0x1c, 0x54, 0x02, 0x65, 0x6e]

# Input a message
raw_message = str(input())

# Create message
message = bytearray(raw_message.encode('utf-8'))
arr[2] = len(message) + 3
arr = bytearray(arr)

total_message = arr + message
print(total_message)
print(len(total_message))

message = ndef.NdefMessage(total_message)
record = message.records[0]
print(record.tnf)
print(record.type)
print(record.payload)

newFile = open("test.bin", "wb")
newFile.write(bytearray(total_message))
