#!/bin/bash

if systemctl list-units --type=service | grep -q "mysql"; then
    serveur=1  # Si le service MySQL est en cours d'exécution, considérer la machine comme un serveur
else
    serveur=0  # Sinon, considérer la machine comme un client
fi

# Enregistrer la valeur dans le fichier de configuration
cat > /home/eleve/Bureau/myGest_IOnR/config.sh <<EOF
#!/bin/bash
#fichier de configuration, qui devra etre auto généré a l'installation du programme

#permet de determiner si programme sur un serveur (1) ou une machine (0). Utile pour IHM
serveur=$serveur

# base de donnée
DB_HOST="localhost"
DB_USER="mygestion"
DB_NAME="mygestion"
EOF

echo "fichier config.sh générer avec succés"

#elements essentiels

echo "installation des elements essentiels du programme"

sudo apt update
sudo apt install mysql
sudo apt install mariadb-server
