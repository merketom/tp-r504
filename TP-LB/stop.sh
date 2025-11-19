#!/bin/bash

docker stop nginx1 nginx2 nginx-lb 2>/dev/null
docker network rm tplb 2>/dev/null

