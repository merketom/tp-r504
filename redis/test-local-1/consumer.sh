#!/bin/bash

#Consomme les valeurs dans la liste Redis

#Paramètres
REDIS_HOST="127.0.0.1"
QUEUE="mafile"
threshold=20000
delay_process=3

#Vérification connexion Redis
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
    nb=$(redis-cli --raw LLEN $QUEUE)

    if [ $nb -gt 0 ]
    then
        #dépilage d'un élément
        value=$(redis-cli --raw RPOP $QUEUE)

        echo "Valeur lue : $value"

        #test seuil
        if [ $value -gt $threshold ]
        then
            echo "ALARME ! valeur=$value"
            sleep $delay_process
        fi

    else
        echo "Liste vide, attente 2s."
        sleep 2
    fi
done
