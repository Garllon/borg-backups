#!/usr/bin/env bash

source .env

LOG='./logs/extract.log'
export REPOSITORY="ssh://${STORAGE_USER}@${STORAGE_BOX_ID}.your-storagebox.de:23/./backups/${REPOSITORY_DIR}"

echo $REPOSITORY

exec > >(tee -i ${LOG})
exec 2>&1

echo '##### List avaialble backups #####'
borg list --short $REPOSITORY

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
