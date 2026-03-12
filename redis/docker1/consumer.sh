#!/bin/bash

# Consomme les valeurs dans la liste Redis

#Paramètres
PARAM=s_redis
QUEUE="mafile"
threshold=20000
delay_process=3

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
    nb=$(redis-cli -h $PARAM --raw LLEN $QUEUE)

    if [ $nb -gt 0 ]
    then
        #dépilage d'un élément
        value=$(redis-cli -h $PARAM --raw RPOP $QUEUE)

        echo "Valeur lue : $value"

        #test seuil
        if [ $value -gt $threshold ]
        then
            echo "ALARME ! valeur=$value"
            sleep $delay_process
        fi

    else
        echo "Liste vide, attente de 2 secondes."
        sleep 2
    fi
done
