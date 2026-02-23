## 🛠️ Étapes réalisées

### 🔧 Configuration réseau

- Configuration des adresses IP statiques via le fichier `/etc/network/interfaces`.
- Tests de ping entre les sous-réseaux.
- Activation de l’IP forwarding sur **deb-router** via le fichier `/etc/sysctl.conf`.
- Application des changements avec `sysctl -p /etc/sysctl.conf`.
- Activation de l’interface reliée à **NAT 1**.  
  La route vers cette interface était déjà présente, ajoutée par mon tuteur lors d’un TP quelques mois auparavant.  
  Cela constitue le lien entre GNS3 et mon PC, ce qui permet à GNS3 d’accéder à mon réseau local géré par ma carte réseau.
- Blocage rencontré : impossibilité pour les machines des sous-réseaux de sortir vers l’extérieur (sauf le routeur).
  - Le routeur redirigeait les paquets mais ne masquait pas les adresses internes.  
    Activation nécessaire du NAT :  
    `iptables -A POSTROUTING -t nat -o enp2s3 -j MASQUERADE`
  - Utilisation de **iptables-persistent** pour appliquer les règles au démarrage.

## 🌐 DNSMASQ

- Configuration de dnsmasq :
  - `domain-needed` : empêche les requêtes vers des noms sans point.
  - `bogus-priv` : évite l’envoi de requêtes Internet pour des adresses privées.
  - `no-resolv` : force l’utilisation du fichier de configuration.
  - `server=9.9.9.9` : serveur DNS utilisé.
  - `address=/monsupersite.serv.arpa/10.1.1.1`
  - `expand-hosts` : ajoute le nom de domaine aux clients DHCP.
  - `address=/webserver.serv.arpa/10.1.1.1`
  - `address=/database.serv.arpa/10.1.1.2`
  - `address=/dnsmasq.corp.arpa/10.1.2.1`
  - `cname=monsupersite.serv.arpa,webserver.serv.arpa`

## 📡 DHCP (via dnsmasq)

- Configuration DHCP :
  - `dhcp-range` : plage d’adresses attribuées.
  - `dhcp-leasefile` : stockage des baux.
  - `dhcp-authoritative` : force l’attribution d’une IP lorsqu’un client rejoint le réseau.
  - Ajout de `address=/monsupersite.serv.arpa/10.1.1.1`
  - `domain=corp.arpa` : ajoute le domaine aux clients DHCP.

## 🗄️ MySQL

- Création de la base de données.
- Création de l’utilisateur `wp_user`, assigné au webserver : `'wp_user'@'10.1.1.1'`.
- Attribution des droits nécessaires à cet utilisateur sur la base.

## 📰 WordPress

- Configuration de WordPress :
  - Nom de la base.
  - Nom d’utilisateur.
  - Mot de passe.
  - Adresse du serveur MySQL.
  - URL du site et page d’accueil.

## 🚀 NGINX

- Création du fichier de configuration du site dans  
  `/etc/nginx/sites-available/monsupersite.serv.arpa`.
- Écoute sur le port **80**.
- Définition de la racine du site (`/var/www/html`).
- Ajout de la page d’index `index.php`.
- `server_name monsupersite.serv.arpa;`

### 📁 Routes et traitement des fichiers

- Bloc `location /` :

      try_files $uri $uri/ /index.php?$args;

  Permet de rediriger les requêtes vers les bons fichiers/dossiers ou de laisser PHP gérer la demande.

- Bloc pour PHP :

      location ~ \.php$ {
          include snippets/fastcgi-php.conf;
          fastcgi_pass unix:/run/php/php8.2-fpm.sock;
      }

  Permet d’envoyer les fichiers `.php` à PHP pour traitement puis retour au navigateur.

- Activation du site via un lien symbolique dans `sites-enabled`.

## 🔐 Certificat HTTPS

- Création de la clé privée `wordpress.key`.
- Création du CSR `wordpress.csr`.
- Création du certificat auto-signé `wordpress.crt`.

### 📜 Création d’une autorité de certification locale (CA)

- Génération du certificat auto-signé **root**.
- Création de `rootCA.key` et `rootCA.crt`.
- Création du fichier `domain.ext` (SAN).
- Signature du CSR précédent avec le certificat root et ajout de l’extension.

### 🔗 Intégration

- Ajout dans NGINX du certificat `.crt` (hors root) et de la clé `.key`.
- Récupération du certificat root depuis Ubuntu via :  
  `scp debian@10.1.1.1:/home/debian/rootCA.crt .`
- Import manuel du certificat dans Firefox.

## 🔒 Fail2ban

- `ignoreip` : exclut une machine du bannissement.
- `findtime` : durée de prise en compte des tentatives.
- `bantime` : durée du bannissement.
- `maxretry` : nombre d’échecs avant bannissement.

## 🧭 Bind

- Création de la zone `serv.arpa` avec le fichier `db.serv.arpa`.
- Ajout de la zone dans `named.conf.local`.
- Lien entre DHCP et DNS pour l’attribution des adresses IP.

## 📦 ISC-DHCP-Server

- Définition des interfaces (`enp2s0` et `ens1`) dans  
  `/etc/default/isc-dhcp-server`.
- Dans `dhcp.conf` :
  - Définition du sous-réseau et des options (DNS, passerelle).
  - Attribution d’adresses fixes via les adresses MAC.
- Installation du service sur **deb-router**.
