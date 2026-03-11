#!/bin/bash

#Lance des consumers selon la charge de la file Redis

QUEUE="mafile"
iter=0
oldnb=0

#lancement du producer en arrière-plan
./producer.sh &

while :
do
    nb=$(redis-cli LLEN $QUEUE)

    iter=$((iter+1))

    echo "- iter $iter, taille liste=$nb"

    #nombre de consumers actifs
    nbjobs=$(jobs | grep Running | wc -l)
    echo "Nb jobs en cours: $nbjobs"

    #si la file augmente, on lance un nouveau consumer
    if [ $nb -gt $oldnb ]
    then
        ./consumer.sh &
    fi

    oldnb=$nb

    sleep 3
done
