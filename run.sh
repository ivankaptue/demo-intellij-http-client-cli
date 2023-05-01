#!/bin/sh

docker run --rm -i -t -v $PWD:/workdir jetbrains/intellij-http-client \
  -L VERBOSE \
  -e dev \
  -v http-client.env.json \
  --report \
  posts.requests.http
