#! /bin/bash

set -x

source .env

ssh -p 23 $STORAGE_USER@$STORAGE_BOX_ID.your-storagebox.de