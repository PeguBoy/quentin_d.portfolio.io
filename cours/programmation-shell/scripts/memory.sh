#!/bin/bash

#Calcule de la mémoire utilisé à l'instant t
MEMUSED=$(free | grep -i mem | awk '{print $3}')
MEMTOT=$(free | grep -i mem | awk '{print $2}')
LIMITE=$(echo "$MEMTOT*70/100" | bc)

#Vérification du pourcentage de mémoire utilisée
echo "Voici la mémoire utilisé :      $MEMUSED"
echo "Voici la mémoire total du PC :  $MEMTOT"
echo "Voici 70% de la mémoire total : $LIMITE"
if [ $MEMUSED -ge $LIMITE ];
then
	echo "La mémoire utilisé dépasse les 70%";
else
	echo "RAS";
fi
