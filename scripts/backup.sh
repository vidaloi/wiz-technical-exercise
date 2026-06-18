#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
mongodump --uri='mongodb://admin:WizExercise2024!@localhost:27017/admin?authSource=admin' --out=/tmp/backup_$DATE
gsutil cp -r /tmp/backup_$DATE gs://wiz-mongo-backups-clgcporg10/
rm -rf /tmp/backup_$DATE
