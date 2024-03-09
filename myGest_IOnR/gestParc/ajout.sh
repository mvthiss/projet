#!/bin/bash

#import des configs et fonctions
source config.sh
source fonction.sh

#bash install/install.sh
#echo $serveur

afficheTitre "Ajout de donnees"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo -e "\Menu:"
echo "1) ajouter une entrée a la table Equipement "
echo "2) ajouter une entrée a la table TypeE"
echo "3) Quitter"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
        read -p " entrez le nom de l'equipement :" nom
        read -p " entrez l'adresse MAC de l'equipement :" adMAC
        read -p " entrez l'adresse IP de l'equipement :" adIP
        read -p " entrez le CIDR de l'equipement :" CIDR
        read -p " entrez l'ID de l'equipement :" idT
        mysql -u mygestion -D mygestion -e "INSERT INTO Equipement(nom,MAC,IP,CIDR,idT) VALUES ('$nom','$adMAC','$adIP','$CIDR','$idT');"
		;;
	2 )
		read -p " entrez le libelle :" libelle
        mysql -u mygestion -D mygestion -e "INSERT INTO TypeE ('libelle') VALUES ('$libelle');"
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


