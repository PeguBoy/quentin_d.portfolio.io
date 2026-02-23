# 🔐 Sauvegarde distante automatisée via SSH

Ce TP a pour objectif de mettre en place une sauvegarde automatisée et sécurisée entre un client et un serveur SSH, en utilisant un script Shell et la planification via `crontab`.

## 📘 Énoncé
L’énoncé complet est disponible dans le fichier suivant :
- [Projet-DATA_Sec.pdf](./Projet-DATA_Sec.pdf)

## 🗂️ Script du TP
Le script principal utilisé pour la sauvegarde automatique est disponible ici :
- [secbckp.sh](./scripts/secbckp.sh)

## 🎯 Objectifs du TP
- Configurer un serveur SSH
- Générer des clés RSA et autoriser l’authentification par clé publique
- Créer une archive de sauvegarde sur le client
- Transférer automatiquement cette sauvegarde vers le serveur via `scp`
- Planifier l’exécution automatique du script avec `crontab`
- Vérifier l’exécution du script via les logs système

## 🖥️ Partie serveur SSH (Étudiant 1)

### 🔧 Installation et préparation
- Installation du service SSH (`openssh-server`)
- Génération d’une paire de clés RSA (`ssh-keygen`)
- Ajout de la clé publique dans `/root/.ssh/authorized_keys`

### 🔐 Configuration
- Modification du fichier `/etc/ssh/sshd_config`
  - Activer l’option : `PermitRootLogin yes`

### 🔄 Redémarrage du service SSH
- Redémarrer le service pour appliquer les modifications

### 📝 Rôle des clés
- La clé privée reste confidentielle
- La clé publique permet l’accès sans mot de passe
- Le serveur accepte les connexions en vérifiant la présence de la clé privée correspondante

## 💻 Partie client SSH (Étudiant 2)

### 📂 Préparation des données
- Création d’un répertoire de sauvegarde
- Copie d’un dossier à sauvegarder (exemple théorique : `/bin`)
- Création d’une archive compressée avec `tar`

### 🗂️ Script de sauvegarde
Un script doit être créé pour envoyer automatiquement l’archive vers le serveur via `scp`, en utilisant la clé privée générée côté serveur.
Le script permet d’automatiser le transfert sécurisé de la sauvegarde.

### 🔓 Droits d’exécution
- Le script est rendu exécutable avec `chmod 700`

## ⏱️ Planification avec crontab

- Le script doit être ajouté dans `crontab` pour s’exécuter automatiquement à une heure donnée (exemple : tous les jours à 12h45)
- Pour tester rapidement, on configure une exécution dans la minute qui suit

### 🧩 Syntaxe crontab
- `mm hh jj MMM JJJ tâche` ici la tâche est d'éxécuter le script
- Exemple : minutes, heures, jour, mois, jour de la semaine, script à exécuter

## 🔍 Vérification et tests

- Utilisation de `tail -f /var/log/syslog` pour observer en temps réel l’exécution des tâches cron, côté client et côté serveur
- Permet de vérifier que la sauvegarde a bien été envoyée
