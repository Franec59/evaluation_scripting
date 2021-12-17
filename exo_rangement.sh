# # Le classeur de rangement

# ## Consigne

# Réaliser un script bash qui va classer dans des sous répertoire
# tous les fichiers d'un répertoire selon leurs extensions.
# Le script prend en argument le nom du répertoire cible
# (ou demande la saisie du dossier cible à trier).

# bonus : faire un fichier de log qui affiche :
#     - le nom du dossier trier
#     - la date à laquelle il a ete trier
#     - le resultat du tri (combien de fichier de chaque type)

# remarque : code doit etre documenté ! 


# Exercice
# =====================================================================================

#!/bin/bash

# Initialiser les variables
tab=()

# Fonction pour supprimer les doublons dans notre tableau tab
# function triExtention(){
#     sort tab
#     #echo ${tab[@]}
#     sort tab | uniq
#     echo ${tab[@]}

#     # IFS=$'\n' sorted=($(sort <<<"${tab[*]}"))
#     # printf "[%s]\n" "${sorted[@]}"

# }

# Fonction pour créer un sous répertoire pour chaque extension
function sousRepertoire(){
    for filename in *; do
        if [[ -f "$filename" ]]; then
            base=${filename%.*}
            ext=${filename#$base.}
            mkdir -p "${ext}"
            mv "$filename" "${ext}"
        fi
done

}


# # Fonction pour déplacer ( mv ) chaque fichier selon son extension dans le répertoire approprié
# function deplacer(){
#     echo "je deplace !"
# }

# Fonction pour lister les extensions de fichier
# function extention(){
#     # je vais dans le dossier
#     cd $dossier
#     # Pour vérifier
#     echo "Extensions"
#     # Création d'une boucle pour parcourir le dossier et récupérer les extensions de fichier
#     for file in *; do 
#         if [ -f "$file" ]; then 
#             # echo "${file##*.}"
#             tab=( "${tab[@]}" "${file##*.}")
#         fi 
#     done
#     #echo ${tab[@]}

# }



# Fonction pour classer le dossier en sous répertoire
function classer(){
    echo "$dossier"
    # je vais dans le dossier à classer
    cd $dossier
    echo " je classe !"
    # extention
    # triExtention
    sousRepertoire


    # Création d'une boucle pour parcourir le dossier
    # for file in *; do 
    #     if [ -f "$file" ]; then 
    #         #echo "$file"
    #         echo "$ext"
    #     fi 
    #done

}

# fonction qui control l'existance du dossier
function controlDossier(){
    echo "$@"
    # control si existe ou control si c'est un dossier
    if [[ ! -e $dossier ]] || [[ ! -d $dossier ]] ; then
        echo "le dossier $dossier n'existe pas !"
        # dossier="/"
    # control si le dossier est vide 
    elif [[ ! -s $dossier ]] ; then
        echo "le dossier $dossier est vide !"
        # echo " sinon dans le dossier home.... "
        # dossier="/"
    else
        echo "le dossier $dossier existe et n'est pas vide"
    fi
  
    
}


# Fonction saisir un dossier
function saisirDossier(){
    read -p "Veuillez saisir un dossier : " dossier
}


# Fonction principale
function main(){
    # Vérifier ce qui est passé en argument
    echo "$@"
    # si le nom du dossier est passé en argument
    if [[ $# -eq 1 ]] ; then
        dossier=$1
    else
    # Si pas de dossier en argument => saisie utilisateur
        saisirDossier
    fi
    # controler la validité du dossier saisit
    controlDossier
    # Fonction pour classer le dossier en sous répertoire
    #classer
    sousRepertoire
    

}




# Appel de la fonction principale recevant x arguments en paramètre
main $@