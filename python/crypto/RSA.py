from Crypto.Util.number import getPrime, bytes_to_long


def generate_keys():
    e = 0x10001    #public exponent e, we generally use this one by default
    while True:
        p = getPrime(512)
        q = getPrime(512)
        phi = (p - 1) * (q - 1)    #Euler's totient 
        d = pow(e, -1, phi)    #Private exponent d
        if d != -1:
            break

    n = p * q
    public_key = (n, e)
    private_key = (n, d)
    return public_key, private_key


def encrypt(plaintext: int, public_key) -> int:
    n, e = public_key
    return pow(plaintext, e, n)    #plaintext ** e mod n


def decrypt(ciphertext: int, private_key) -> int:
    n, d = private_key
    return pow(ciphertext, d, n)   #ciphertext ** d mod n


message = bytes_to_long(b"<ourmessage>")
public_key, private_key = generate_keys()
ciphertext = encrypt(message, public_key)
plaintext = decrypt(ciphertext, private_key)