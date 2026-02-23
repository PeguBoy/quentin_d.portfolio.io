# 🏥 High Availability — Cluster Web Actif/Passif

Ce TP consiste à mettre en place une solution de **haute disponibilité (High Availability)** permettant d’assurer la continuité de service d’un serveur Web en cas de panne.
L’objectif est de créer un cluster de deux serveurs fonctionnant en mode **Actif/Passif**, capables de partager une **adresse IP virtuelle** basculant automatiquement en cas de défaillance.

## 📘 Énoncé
L’énoncé complet est disponible dans le fichier suivant :
- [Sujet_projet_HA.pdf](./Sujet_projet_HA.pdf)

## 📚 Documentation suivie
Pour la configuration du cluster et de l’adresse IP virtuelle, le guide suivant a été utilisé :
- [Documentation UCARP](https://doc.ubuntu-fr.org/ucarp?do=)

## 🎯 Objectifs du TP
- Mettre en place deux serveurs Web sous Debian/Ubuntu
- Installer et configurer Apache2 sur chaque serveur
- Créer un cluster Actif/Passif entièrement automatisé
- Mettre en place une **adresse IP virtuelle** partagée par les deux serveurs
- Permettre l’accès et l’administration distante via SSH
- Tester et valider le mécanisme de bascule (failover)

## 🖥️ Contexte et problématique

L’objectif est d’assurer la continuité de service d’un serveur Web existant.
Pour cela, deux machines sont configurées en haute disponibilité :

- Serveur maître : `192.168.1.1`
- Serveur esclave : `192.168.1.2`
- **Adresse IP virtuelle** : `192.168.1.3`

Le cluster doit faire en sorte que l’adresse `192.168.1.3` soit toujours accessible, même en cas de panne du serveur maître.
Le client Web (Firefox/Chrome) ne connaît que cette IP virtuelle.

Si le serveur maître tombe :
→ Le serveur esclave prend automatiquement la main et répond à l’adresse virtuelle.

Une fois le serveur maître restauré, deux comportements sont possibles :
- il redevient le nœud de secours
- ou il peut reprendre immédiatement le rôle actif

## 🧩 Découpage des tâches

### ✔️ Mise en place du cluster
Installation et configuration des outils nécessaires à la gestion du cluster, notamment pour :
- gérer le basculement (failover)
- activer ou désactiver un nœud
- attribuer et transférer l’adresse IP virtuelle

### ✔️ Tests et validation
Effectuer la recette du cluster :
- simulation de panne du serveur maître
- vérification de la réaction du serveur esclave
- test de restauration du nœud primaire
- validation du fonctionnement automatique sans intervention humaine

## 🔍 Comportement attendu
- Le serveur actif doit répondre aux requêtes Web via l’adresse virtuelle
- Le basculement doit être automatique en cas de panne du nœud primaire
- Le retour en service d’un nœud doit être géré correctement selon la configuration choisie
