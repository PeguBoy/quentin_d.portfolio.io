# 🐳 Mini-Lab – Création d'une image Docker avec Nginx

## 🎯 Objectif

Créer une image Docker personnalisée à l’aide d’un Dockerfile.
L’image devra être basée sur Debian 12 et contenir un serveur Nginx fonctionnel, accessible depuis la machine hôte.

---

## 📋 Consignes

- Tu dois créer une image Docker.
- Cette image doit utiliser comme base : `debian:12`.
- L’image doit contenir et faire tourner un serveur Nginx.
- Une fois l’image construite, tu dois être capable de lancer un conteneur basé sur cette image.
- En lançant ce conteneur, tu dois pouvoir accéder à la page d’accueil par défaut de Nginx via ton navigateur, à l’adresse suivante : `http://localhost`.
- Tu dois obligatoirement utiliser un Dockerfile pour construire l’image.

---

> 💡 Bien que le Dockerfile soit très court, sa création m’a permis de comprendre en profondeur les subtilités de Docker, notamment l’importance de lancer un processus en premier plan (foreground) pour éviter l’arrêt du conteneur.
> J’ai également appris à construire une image Docker “from scratch” et à manipuler les particularités du fonctionnement de Nginx dans ce contexte.
