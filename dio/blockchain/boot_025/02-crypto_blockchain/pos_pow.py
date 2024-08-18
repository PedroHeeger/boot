# PoS
# import hashlib

# def calculate_hash(header):
#     return hashlib.sha256(header.encode()).hexdigest()

# header = "transactions_data_previous_hash"
# block_hash = calculate_hash(header)
# print(block_hash)




# PoW
import hashlib

def calculate_hash(header):
    return hashlib.sha256(header.encode()).hexdigest()

def find_nonce(header):
    nonce = 0
    while True:
        hash_result = calculate_hash(header + str(nonce))
        if hash_result.startswith('0000'):  # Critério de dificuldade
            return nonce, hash_result
        nonce += 1

header = "transactions_data_previous_hash"
nonce, valid_hash = find_nonce(header)
print(nonce)
print(valid_hash)