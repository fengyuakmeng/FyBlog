#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

import os
import sys

BLOCK_SIZE = 8
key = os.urandom(8)
iv = os.urandom(8)

def pad(data):
    padding_len = BLOCK_SIZE - len(data) % BLOCK_SIZE
    return data + (chr(padding_len) * padding_len).encode()

def xor(data,key):
    return bytes([x ^ key[i%len(key)] for i, x in enumerate(data)])

def encrypt(data):
    padded_msg = pad(data)
    padded_msg_count = len(padded_msg) // BLOCK_SIZE
    c = []
    TempIV = iv
    for i in range(padded_msg_count):
        xored_plain = xor(padded_msg[i*BLOCK_SIZE:(i+1)*BLOCK_SIZE], TempIV)

        cipher_text = xor(xored_plain, key)
        TempIV = cipher_text
        c.append(cipher_text)
    return b''.join(c)



if __name__ == '__main__':
    if len(sys.argv) > 2:
        print('usage: %s <plain_text>')
        sys.exit(0)
    print(key.hex())
    print(iv.hex())
    with open(sys.argv[1], 'rb') as f:
        encrypted = encrypt(f.read())

    with open(sys.argv[1]+'.encrypted', 'wb') as f:
        f.write(encrypted)

