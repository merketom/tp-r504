#!/bin/bash

#Génère des valeurs aléatoires dans une file Redis

#Paramètres
QUEUE="mafile"
n=10
delay=2

#Vérification connexion Redis
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]
then
    echo "Erreur, pas de connection avec le serveur redis !"
    exit 1
fi

#Boucle infinie
while true
do
    #burst de production
    for ((i=0;i<n;i++))
    do
        redis-cli LPUSH $QUEUE $RANDOM > /dev/null
    done

    #affichage de la taille de la file
    size=$(redis-cli --raw LLEN $QUEUE)
    echo "Taille de la file : $size"

    sleep $delay
done
