#!/usr/bin/env python3

import argparse
import base64
import requests

from Crypto.PublicKey import RSA
from Crypto.Util.number import bytes_to_long


def gen_new_key():
    return RSA.generate(2048)


def gen_key_using_gluu(url):
    data = requests.get(url, verify=False).json()
    keyDatas = [
        {'mod': key['n'], 'exp': key['e']}
        for key in data['keys'] if key['alg'] == 'RS512'
    ]
    return [
        genRSA(keyData['mod'], keyData['exp'])
        for keyData in keyDatas
    ]


def genRSA(mod_b64, exp_b64):
    mod = base64Decode(mod_b64)
    exp = base64Decode(exp_b64)
    key = RSA.construct((bytes_to_long(mod), bytes_to_long(exp)))
    return key


def base64Decode(b64strUnicode):
    b64str = str(b64strUnicode)
    missing_padding = "=" * (4 - len(b64str) % 4)
    return base64.b64decode(b64str + missing_padding, '-_')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('url', nargs='?', help="Gluu UER to generate key")
    args = parser.parse_args()

    if args.url:
        for key in gen_key_using_gluu(args.url):
            print(key.exportKey('OpenSSH').decode())
    else:
        key = gen_new_key()

        # Save private key.
        with open('keys/rsa', 'wb') as f:
            f.write(key.exportKey('PEM'))

        # Save public key
        with open('keys/rsa.pub', 'wb') as f:
            f.write(key.exportKey('OpenSSH'))

        return key.exportKey('OpenSSH')


if __name__ == "__main__":
    main()
