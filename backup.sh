#!/bin/bash
mkdir /backup/
cd /backup/

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

mysqldump -h $1 -u $2 -p$3 --all-databases > "$current_time.sql"
az storage blob upload --account-name $4 --account-key $5 -f "$current_time.sql" -c $6 -n "$current_time.sql"
