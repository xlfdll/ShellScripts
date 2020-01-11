#!/bin/bash

# $1 = Name
# $2 = Valid Days

openssl genrsa -out $1.key 2048
openssl req -x509 -new -nodes -key $1.key -sha256 -days $2 -out $1.pem
openssl pkcs12 -export -out $1.pfx -inkey $1.key -in $1.pem