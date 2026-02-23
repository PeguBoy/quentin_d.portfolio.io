**Lab 3 Mystery Web Server :**
- Contexte:
	1 serveur web Nginx servi par debserv-lan2, servant en HTTP sur un port autre que 80.
	1 routeur (debian-routeur) interconnectant LAN1 (10.1.1.0/24), LAN2 (10.2.2.0/24) et l'extérieur.
	Un accès SSH uniquement sur debian-router.
	Identifiants SSH debian-router:
	user: debian
	mdp: debian
	Un client envoyant toutes les minutes une requête HTTP vers une page protégée par mot de passe
	hébergé sur le serveur web.
- Objectifs:
	Se connecter en SSH à debian-router
	Trouver en CLI depuis debian-router l'adresse MAC des deux serveur debserv-lan1 et debserv-lan2
	Trouver quel port utilise le serveur web, ce dernier étant situé entre 1 et 200.
	Intercepter depuis debian-router la trame TCP contenant les identifiants de la page Web.
	Accéder à la page web depuis debian-router en utilisant curl uniquement.
- Contraintes:
	Accès uniquement à debian-router via SSH.
	Utilisation imposée des outils tcpdump, nmap et curl disponibles sur la machine.
- Quelques pistes:
	Le mot de passe est encodée en base64, dois être décodé en base64 et se trouve après la string
	Authorization: Basic dans la trame réseau envoyée par debserv-lan1. La string obtenue se
	présente sous la forme utilisateur:motdepasse .`
	Curl possède un argument pour fournir des identifiants basiques.