#!/bin/bash

count1=0
count2=0

for i in $(seq 1 500) #Boucle principale
do
    result=$(curl -s http://localhost:83) #-s texte inutile

    if [[ $result == *"Hello 1"* ]]; then #Teste réponse reçue
        ((count1++))
    elif [[ $result == *"Hello 2"* ]]; then
        ((count2++))
    fi
done

echo "Serveur 1 (Hello 1) > $count1 réponses"
echo "Serveur 2 (Hello 2) > $count2 réponses"

total=$((count1 + count2)) #Cacul %
if [ $total -ne 0 ]; then
    ratio1=$((count1 * 100 / total))
    ratio2=$((count2 * 100 / total))
    echo
    echo "Serveur 1 > ${ratio1}%"
    echo "Serveur 2 > ${ratio2}%"
else
    echo "Aucune réponse reçue."
fi

