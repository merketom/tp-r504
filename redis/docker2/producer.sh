#!/bin/bash

#Génère des valeurs aléatoires dans une file Redis

#Paramètres
PARAM="redis://default:X3vemLGf1gbTF9WYejtskPir0S9IYQ1T@redis-11814.c275.us-east-1-4.ec2.cloud.redislabs.com:11814"
QUEUE="mafile"
n=10
delay=2

#Vérification connexion Redis
redis-cli -u "$PARAM" DBSIZE >/dev/null
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
        redis-cli -u "$PARAM" LPUSH $QUEUE $RANDOM > /dev/null
    done

    #affichage taille de la file
    size=$(redis-cli -u "$PARAM" --raw LLEN $QUEUE)
    echo "Taille de la file : $size"

    sleep $delay
done
