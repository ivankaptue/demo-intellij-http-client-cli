#!/bin/sh

openssl genrsa -out data/private.pem 2048
openssl rsa -in data/private.pem -outform PEM -pubout -out data/public.pem

PRIVATE_KEY=$(cat data/private.pem) && jq --null-input --arg privateKey "$PRIVATE_KEY" '{
  "dev": {
    "privateKey": $privateKey
  },
  "stg": {
    "privateKey": $privateKey
  }
}' > http-client.private.env.json

