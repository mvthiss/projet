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
echo "1) modifier une entrée a la table Equipement "
echo "2) modifier une entrée a la table TypeE"
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
        mysql -u mygestion -D mygestion -e " UPDATE Equipement SET nom='$nom', adMAC='$adMAC',adIP='$adIP',CIDR='$CIDR',idT='$idT' WHERE id='$id';"
		;;
	2 )
		read -p " entrez le libelle :" libelle
        mysql -u mygestion -D mygestion -e "UPDATE TypeE SET libelle='$libelle' WHERE id='id';"
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


