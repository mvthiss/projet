#!/bin/bash

#import des configs et fonctions
source config.sh
source fonction.sh

#bash install/install.sh
#echo $serveur

afficheTitre "Consulatation de la table"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo -e "\nMenu:"
echo "1) Equipement"
echo "2) TypeE"
echo "3) Quitter"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		mysql -u mygestion -D mygestion -e "SELECT * FROM Equipement";
		;;
	2 )
		mysql -u mygestion -D mygestion -e "SELECT * FROM TypeE";
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


