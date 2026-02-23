# Objectif du workshop

* Prise en main des commandes de bases de docker CLI.  
* Création d'un Dockerfile et personnalisation d'une image préexistante.  
* Paramétrage et lancement d'un serveur web containeriser en local.

# Énoncé du workshop

À partir d'une image de base fournie, il faudra construire une autre image incorporant les bons paramètres afin que l'application s’exécute correctement.

## Image de base

L'image de base est construite à partir d'une image `alpine`, et contient le serveur web `nginx`. Elle contient un fichier de configuration nginx custom (`nginx.conf`), servant tous les sites configurés via fichier `.conf` présents dans le répertoire `/etc/nginx/site_conf/`. Deux fichiers .html sont présents dans `/var/www/html`. L'un est le fichier servi par défaut, et l'autre celui que l'on désire servir.   
Une configuration de site templatisé est disponible dans `/etc/nginx/site_conf/site.conf.template`. Cette configuration templatisé contient une variable indiquant quelle page HTML servir.

## Image à construire

Un Dockerfile est proposé et à compléter.   
Ce Dockerfile, en l'état, ne fait qu'exécuter le script `entrypoint.sh`.   
Ce script substitue la variable présente dans `site.conf.template` par sa valeur configurée en variable d’environnement, place le fichier de configuration modifié dans `/etc/nginx/site_conf/` et lance nginx. Nginx servira le fichier .html défini dans la configuration issue du template.  
La valeur de la variable est récupérée depuis les variables d'environnement, et est configurée avec une valeur par défaut si elle n’est pas définie lors du build de l’image.   
La valeur de la variable doit être “club”.  
L'image est construite à partir de l'image `local.home/nginx_base:latest`, qui est disponible sur la branche `add-docker-image` du repo.

# Tâches à réaliser

## Préparation du lab

1 Récupérer le Dockerfile depuis le repo dédié sur la branche main
2 À partir d'une branche partant de `main`, récupérer depuis la branche `add-docker-image` l'image docker `local.home/nginx_base:latest`, sauvegardée dans le fichier `nginx_base.tar.gz`. Ajouter cette image à un commit et pousser la branche. /\!\\ La branche `add-docker-image` contient un commit supprimant le fichier `Dockerfile`, et un autre en créant un mauvais.   
3 Faire un commit ajoutant l'image `local.home/nginx_base:latest`   
4 Importer dans docker l'image fournie

## Création de l'image finale

1 Dans l'image importée `local.home/nginx_base:latest`, trouver le nom de la variable à configurer et la renseigner dans le Dockerfile $WEBSITE\_SLUG  
2 Trouver sur quel port sont servies les pages HTML :90  
3 Construire l'image avec `docker build` et la lancer avec `docker run`   
4 Tester le bon fonctionnement en se rendant sur la page servie par le navigateur (proto http)   
5 Commiter le Dockerfile correctement configuré et faire une Merge request

# Tips and tricks

* L'image de base est construite de manière à lancer automatiquement une commande définie via l'instruction `ENTRYPOINT`. Lors d'un `docker run` cette commande est exécutée et le container après exécution. Cette instruction peut-être modifiée avec l'usage du bon paramètre avec `docker run`.  
* Le fichier de configuration est généré lors du build de l’image. La modification de la variable d'environnement n’est visible qu’après avoir reconstruit cette dernière.  
* Pour investiguer dans le container de base, et après avoir modifié le comportement du service au lancement, les fichiers à investiguer sont dans: `/etc/nginx/site_conf`, et `/var/www/html`.  
* Sans le bon paramètre, aucun port n'est ouvert sur le conteneur depuis l’hôte.   
  Un paramètre est nécessaire lors de l'exécution de `docker run` pour le faire.  
* Il est possible de récupérer un commit particulier ou des fichiers depuis une autre branche.

# Questions

* Qu'est ce que Nginx ?   
* Qu'est ce qu'Alpine ? Pourquoi l'utiliser plutôt qu'un autre ? Quelle est l'une de ses principales particularités par rapport aux librairies qu’elle utilise ?  
* Quelles sont les deux instructions permettant de définir des variables d'environnement dans un Dockerfile, et quelle est la principale différence entre les deux?  
* Quels peuvent être les risques de l'usage de ces deux instructions lors de la distribution en open-source d'image les contenant?  
* Est-il possible de récupérer le Dockerfile de l'image de base, et si oui comment?  
* Bonus:   
  * qu’est ce qui pourrait poser souci dans l’implémentation d’un logiciel “non alpine” sur Alpine?  
  * Puis-je, juste en modifiant la variable d’environnement, faire en sorte que nginx serve le fichier `/var/www/html/toto/page.html`?  
    Si oui, quelle serait la valeur de la variable?
