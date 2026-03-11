#!/bin/bash

#Consomme les valeurs dans la liste Redis

#Paramètres
QUEUE="mafile"
threshold=20000
delay_process=3

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
    nb=$(redis-cli --raw LLEN $QUEUE)

    if [ $nb -gt 0 ]
    then
        #dépilage d'un élément dans la file
        value=$(redis-cli --raw RPOP $QUEUE)

        #si la valeur dépasse un seuil, on simule un traitement plus long
        if [ $value -gt $threshold ]
        then
            sleep $delay_process
        fi

    else
        #si la file est vide, le consumer se termine
        exit 0
    fi
done
