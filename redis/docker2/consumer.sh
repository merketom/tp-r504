#!/bin/bash

# Consomme les valeurs dans la liste Redis

#Paramètres
PARAM="redis://default:X3vemLGf1gbTF9WYejtskPir0S9IYQ1T@redis-11814.c275.us-east-1-4.ec2.cloud.redislabs.com:11814"
QUEUE="mafile"
threshold=20000
delay_process=3

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
    nb=$(redis-cli -u "$PARAM" --raw LLEN $QUEUE)

    if [ "$nb" -gt 0 ] 2>/dev/null
    then
        #dépilage d'un élément
        value=$(redis-cli -u "$PARAM" --raw RPOP $QUEUE)

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
