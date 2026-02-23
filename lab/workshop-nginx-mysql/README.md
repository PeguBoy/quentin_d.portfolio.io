# Workshop Nginx & MySQL

## 🎯 Objectifs

- Mettre en place une infrastructure réseau virtualisée via GNS3
- Installer et configurer un serveur web **Nginx**, une base de données **MySQL** et un serveur DNS/DHCP **dnsmasq**
- Installer et configurer une application web **WordPress**
- Effectuer une sauvegarde de base de données **MySQL**

## 🗺️Schéma de l’infrastructure

![Schéma de l'infrastrucuture](../../.captures/workshop-nginx-mysql/infra.png)

## 🧩 Tâches à réaliser

### 1. Configurer la VM debian12 “deb-router”

- Faire office de routeur entre les différents LAN et le NAT
- Configuration attendue :
  - Configuration des routes
  - Configuration des interfaces pour permettre la bonne communication entre les réseaux

### 2. Installer les postes et services suivants (Debian 12)

#### • webserver.serv.arpa

- Serveur web Nginx
- Adresse IP statique

#### • database.serv.arpa

- Serveur MySQL
- Héberge la base de données WordPress
- Adresse IP statique

#### • dnsmasq.corp.arpa

- Serveur dnsmasq proposant :
  - résolution DNS
  - attribution d’adresses IPv4 par DHCP
- Adresse IP statique

#### • client.corp.arpa

- Client desktop Ubuntu
- Adresse IP attribuée par DHCP
- Utilise dnsmasq.corp.arpa comme resolveur DNS

## ⚙️ Configurations attendues

### Nginx

- Servir WordPress sur le port **80**

### WordPress

- Utiliser la base de données servie par **database.serv.arpa**
- Installation via l’archive officielle du site de l’éditeur

### MySQL

- Une base de données doit être disponible et accessible pour WordPress

### dnsmasq

- DNS :
  - Serve la zone **corp.arpa**
  - DNS upstream : **9.9.9.9**
- DHCP :
  - Sert la zone **corp.arpa**
  - Plage d’IP : **10.1.2.20 – 10.1.2.50**

## ✅ Résultats attendus

- WordPress accessible à l’adresse :\
  **http(s)://monsupersite.serv.arpa** depuis client.corp.arpa
- Attribution d’une adresse DHCP à client.corp.arpa
- Résolution par client.corp.arpa :
  - des hostnames du LAN
  - des hostnames extérieurs
- Tous les postes accèdent au WAN

## ⚠️ Points d’attention

- Ne pas demander la résolution des hostnames du LAN virtualisé depuis le PC hôte
- Ne pas servir d’adresses DHCP du LAN virtualisé sur le LAN de l’hôte

## ⭐ Bonus

- DHCP également sur zone “serv.arpa”, avec IP dynamiques
- dnsmasq attribué automatiquement par DHCP aux serveurs serv.arpa
- Certificat auto-signé pour WordPress (HTTPS)
- Accéder aux serveurs en SSH depuis le PC hôte
- Installer fail2ban pour bannir après 2 échecs SSH durant 30 min
- Remplacer deb-router par un routeur Cisco

## 🚀 Bonus (avancé)

- Remplacer dnsmasq par bind + isc-dhcp-server
- Mise en place de dynamic updates (Bind)
