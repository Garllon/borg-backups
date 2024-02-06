#!/usr/bin/env bash

source .env

LOG='./logs/backup.log'
export REPOSITORY="ssh://${STORAGE_USER}@${STORAGE_BOX_ID}.your-storagebox.de:23/./backups/${REPOSITORY_DIR}"

echo $REPOSITORY

exec > >(tee -i ${LOG})
exec 2>&1

echo "###### Backup gestartet: $(date) ######"

echo "Übertrage Dateien ..."

borg create -v --stats                   \
    $REPOSITORY::'{now:%Y-%m-%d_%H-%M}'  \
    ~/Documents/Unterlagen               \
    ~/Documents/Musik

echo "###### Backup beendet: $(date) ######"