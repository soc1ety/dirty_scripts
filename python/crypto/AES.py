from Crypto.Util.number import *
from Crypto.PublicKey import RSA
from Crypto.Cipher import AES

with open('pubkey.pem') as f:
    pk = RSA.import_key(f.read())

print(pk.n)


p = 420 # change this 

phi = p * p * (p-1)

d = inverse(pk.e, phi)

with open('key') as f:
    k = bytes.fromhex(f.read())

with open('flag.txt.aes', 'rb') as f:
    c = f.read()
c = c[:-1]

k = bytes_to_long(k)
k = pow(k, d, pk.n)
k = long_to_bytes(k)
print(k)
print(len(k))
print(len(c))

cipher = AES.new(k, AES.MODE_ECB)
m = cipher.decrypt(c)
print(m)