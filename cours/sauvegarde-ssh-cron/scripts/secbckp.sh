#!/bin/sh
scp -i /home/$USER_CLIENT/id_rsa /root/sauvegarde.tar.gz root@IP.SERVER:/home/$USER_SERVER/Bureau
