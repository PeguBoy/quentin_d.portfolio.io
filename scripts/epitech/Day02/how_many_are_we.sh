#grep -i ";$1$" - | wc -l || cat - | wc -l
#!/bin/bash

# Si $1 est vide, compte les lignes de l'entrée via cat, sinon utilise grep
[ -z "$1" ] && cat - | wc -l || grep -c -i ";$1$" 

