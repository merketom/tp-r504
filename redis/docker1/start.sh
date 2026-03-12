#!/bin/bash

#Stop et suppression des conteneurs existants
docker stop $(docker ps -q) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

#Création du réseau
docker network create myredis 2>/dev/null

#Construction des images
docker build -t img_cons -f Dockerfile_c .
docker build -t img_prod -f Dockerfile_p .

#Démarrage du serveur Redis
docker run -d \
--network myredis \
--name s_redis \
redis:latest

#Démarrage du consumer
docker run -d \
--network myredis \
--name s_cons \
img_cons

#Démarrage du producer
docker run -d \
--network myredis \
--name s_prod \
img_prod
