#!/bin/bash

#Génère des valeurs aléatoires dans une file Redis

#Paramètres
PARAM=s_redis
QUEUE="mafile"
n=10
delay=2

#Vérification connexion Redis
redis-cli -h $PARAM DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connexion avec le serveur redis !"
    exit 1
fi

echo "Connexion Redis OK !"

#Boucle infinie
while true
do
    #burst de production
    for ((i=0;i<n;i++))
    do
        redis-cli -h $PARAM LPUSH $QUEUE $RANDOM > /dev/null
    done

    #affichage taille de la file
    size=$(redis-cli -h $PARAM --raw LLEN $QUEUE)
    echo "Taille de la file : $size"

    sleep $delay
done
