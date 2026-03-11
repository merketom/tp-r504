#!/bin/bash

#Envoie des bursts de valeurs aléatoires dans une liste Redis

#Paramètres
REDIS_HOST="127.0.0.1"
QUEUE="mafile"
n=10          #taille du burst
delay=2       #pause entre les bursts

#Vérification de la connexion Redis
redis-cli -h $REDIS_HOST DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

echo "Connexion Redis OK !"

#Boucle infinie
while true
do
    echo "Production de $n valeurs..."

    #Burst de valeurs aléatoires
    for ((i=0;i<n;i++))
    do
        redis-cli -h $REDIS_HOST LPUSH $QUEUE $RANDOM > /dev/null
    done

    #Affichage taille de la file
    size=$(redis-cli --raw LLEN $QUEUE)
    echo "Taille de la file : $size"

    #Pause
    sleep $delay
done
