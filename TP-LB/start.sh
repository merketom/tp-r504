#!/bin/bash

# (a)
docker network create tplb 2>/dev/null

# (b)
docker build -t im-nginx-lb ./tp-A

# (c) 
mkdir -p shared1 shared2

# (d)
echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

# (e)
docker run -d --rm \
  --name nginx1 \
  --network tplb \
  -p 81:80 \
  -v "$(pwd)/shared1:/usr/share/nginx/html" \
  nginx

docker run -d --rm \
  --name nginx2 \
  --network tplb \
  -p 82:80 \
  -v "$(pwd)/shared2:/usr/share/nginx/html" \
  nginx

# (f)
docker run -d --rm \
  --name nginx-lb \
  --network tplb \
  -p 83:80 \
  im-nginx-lb


