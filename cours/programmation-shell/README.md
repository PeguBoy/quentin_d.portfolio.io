# 🐚 Programmation Shell

Ce dossier regroupe plusieurs exercices pratiques de scripting Bash réalisés en cours.  
Ils permettent de manipuler les commandes GNU/Linux, automatiser des tâches simples et écrire des scripts exécutables.

## 📘 Énoncé

L’énoncé complet des exercices se trouve dans le fichier suivant :

- [Shell-scripting.pdf](./Shell-scripting.pdf)

## 📄 **Scripts associés :**

- [monip.sh](./scripts/monip.sh) — Exercice 2
- [memory.sh](./scripts/memory.sh) — Exercice 3

## 📝 Exercice 2 — Affichage des interfaces réseau

Écrire un script qui affiche la liste des interfaces réseau configurées ainsi que leurs adresses IP et MAC.\
L’objectif est d’utiliser `ip` ou `ifconfig` tout en filtrant leur sortie avec des pipes (`|`) pour ne conserver que les informations pertinentes.

## 📝 Exercice 3 — Surveillance de la mémoire

Créer un script qui mesure la consommation mémoire de la machine et affiche une alerte dès que l’utilisation dépasse 70 %.  
Le seuil doit être calculé dynamiquement à partir de la RAM totale.  
Utilisation de la commande `free`.

## 📝 Exercice 4 — Test périodique du réseau

Créer un script `ping-reseau.sh` qui teste régulièrement (toutes les 20 secondes, par exemple) la connectivité réseau en envoyant 2 requêtes ping vers une autre machine du réseau.  
Après chaque test, le script écrit dans `/var/log/test-reseau.log` la date, l’heure et le résultat du test.

## 📝 Exercice 5 — Annuaire téléphonique en Shell

Créer un petit programme gérant un annuaire téléphonique stocké dans un fichier.  
Chaque fiche contient un nom et un numéro de téléphone, séparés par une virgule.  
Le script doit afficher un menu permettant de :

- ajouter une fiche
- rechercher une fiche (par partie du nom)
- supprimer une fiche
- modifier une fiche
- lister toutes les fiches
- quitter le programme
