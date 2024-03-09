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
echo -e "Menu:"
echo "1) supprimer une entrée a la table Equipement "
echo "2) supprimer une entrée a la table TypeE"
echo "3) Quitter"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
        read -p " entrez l'id de l'equipement a supprimer :" id
        mysql -u mygestion -D mygestion -e "DELETE FROM Equipement WHERE id=$id;"
        ;;
	2 )
		read -p " entrez ll'id du typeE a supprimer : " id 
        mysql -u mygestion -D mygestion -e "DELETE FROM TypeE WHERE id=$id;"
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


