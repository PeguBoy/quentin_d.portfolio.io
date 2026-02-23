1.  Nginx est un serveur web souvent utilisé car il est léger et rapide.
2.  Alpine est un OS sous Linux, il est utilisé car il est extrêmement léger comparé à Ubuntu/Debian. La librairie utilisée assure une grande sécurité.
3. ` ENV `et `ARG` où `ENV` la valeur persiste dans l'image et donc dans le `docker run` tandis que `ARG` n'est utilisé que dans le build et n'est plus dispo lors de `docker run`.
4. Dans un projet open source tout le monde a accès à l'image que l'on a construit donc il faut faire attention à ce que l'on attribue. Avec `ENV` les valeurs sont accessibles une fois l'image construite et `ARG` est visible également via la commande `docker history` ou `docker inspect`
5. Il n'est pas possible de récupérer le dockerfile lorsque l'image est construite mais avec la commande `docker history` il est possible d'avoir un visuel sur la manière dont est construite l'image.
6. La librairie Alpine étant particulière, elle ne permet d'utiliser que des logiciels compatible sinon les autres logiciels (Apache par exemple) ne pourrait pas fonctionner sous une image docker Alpine.
7. L'une des principales particularités d'Alpine est qu'il utilise musl libc au lieu de glibc. musl libc est plus petite, plus simple et plus rapide que glibc, ce qui contribue à la légèreté d'Alpine.
Cependant, cette particularité peut rendre certaines applications incompatibles, surtout si elles sont développées avec glibc. 
8. On peut modifier une variable d'environnement en appliquant la commande `docker run --env VAR="$var"`, dans notre cas la variable serait *./toto/page.html* 
