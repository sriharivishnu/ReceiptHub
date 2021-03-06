import ndef

# Constant headers
arr = [
    0xd1, 0x01, 0x1c, 0x54, 0x02, 0x65, 0x6e]

# Input a message
# raw_message = str(input())

# Create message
message = bytearray("raw_message".encode('utf-8'))
arr[2] = len(message) + 3
arr = bytearray(arr)

total_message = arr + message
print(total_message)
print(len(total_message))

message = ndef.NdefMessage([0xd1, 0x02, 0x1c, 0x53, 0x70, 0x91, 0x01, 0x09, 0x54, 0x02,
                            0x65, 0x6e, 0x4c, 0x69, 0x62, 0x6e, 0x66, 0x63, 0x51, 0x01,
                            0x0b, 0x55, 0x03, 0x6c, 0x69, 0x62, 0x6e, 0x66, 0x63, 0x2e,
                            0x6f, 0x72, 0x67])
record = message.records[0]
print(record.tnf)
print(record.type)
print(record.payload)

# newFile = open("test.bin", "wb")
# newFile.write(bytearray(total_message))

[0xd1, 0x02, 0x1c, 0x53, 0x70, 0x91, 0x01, 0x09, 0x54, 0x02,
    0x65, 0x6e, 0x4c, 0x69, 0x62, 0x6e, 0x66, 0x63, 0x51, 0x01,
    0x0b, 0x55, 0x03, 0x6c, 0x69, 0x62, 0x6e, 0x66, 0x63, 0x2e,
    0x6f, 0x72, 0x67]
