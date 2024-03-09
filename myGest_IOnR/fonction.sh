#!/bin/bash
source config.sh

# fonction pour afficher les titres
function afficheTitre () {
    if (( $serveur == 1 ))
    then
        figlet $1
    else
        figlet $1 | lolcat
    fi
}

function estuneIP (){
    #saisie IP
read -p "Veuillez saisir une adresse IP à tester :" ip
    #ping
vip=$(ping -c 4 $ip | grep " 0%" | wc -l)

    #verif du ping

echo "Envoie de la requête ICMP..."

if [ $vip -eq 1 ]; then
    echo "L'adresse IP $ip répond aux pings."
else
    echo "L'adresse IP $ip ne répond pas aux pings."
fi
}

function estTCP (){
    # Saisie de l'adresse IP
read -p "Veuillez saisir une adresse IP: " ip

# si seulement l'ip est vide
if [ -z "$ip" ]; then
    echo "Vous devez entrer une adresse IP."
    exit 1
fi

# Saisie du numéro de port TCP
read -p "Veuillez saisir un numéro de port TCP: " port

# si seulement le port est vide
if [ -z "$port" ]; then
    echo "Vous devez entrer un numéro de port TCP."
    exit 1
fi

echo "Envoie de la requête TCP ..."

# Test connexion au port sur l'adresse IP 
nc -zv $ip $port 

# Vérif code de sortie de la commande nc
if [ $? -eq 0 ]; then
    echo "Le port $port sur l'adresse IP $ip est ouvert."
else
    echo "Le port $port sur l'adresse IP $ip est fermé."
fi
}

function estTXT (){

mysql --user="mygestion" --database="mygestion" --execute="SELECT adIP FROM Equipement;" -N > fichier.txt #generation fichier avec IP du tableau adIP de la BDD

if [ $? -eq 0 ]; then
    echo "Le fichier texte a été généré avec succès."
else
    echo "Une erreur s'est produite lors de la génération du fichier texte."
fi
}

function estValid(){
    ip=$1
    ping -c 1 -W 1 $ip
    return $?
}

function checkip(){
    addressesip=($(mysql --user="mygestion" --database="mygestion" --execute="SELECT adIP FROM Equipement" -N))
    for ip in "${addressesip[@]}";do # les éléments du tableau qui se trouve dans adIP
    estValid $ip
    if [ $? -eq 0 ]; then
    echo -e "\e[32m$ip est actif\e[0m"  # vert 
    else
        echo -e "\e[31m$ip est inactif\e[0m"  # rouge
    fi
    done
}