
#!/bin/bash

# Cleanup log
rm -f /logs/backupDB.log

# Set mailbody
echo -e "\nThis script will backup the PiHole DB" >> /logs/backupDB.log
echo -e "\nBackup running..." >> /logs/backupDB.log

sqlite3 /etc/pihole/pihole-FTL.db ".backup /backups/pihole-FTL_$(date +"%m-%y").db.backup" 1> /logs/backupDB.log

echo -e "\nBackup completed" >> /logs/backupDB.log

# Send mail
mail -s "PiHole Backup DB results" yourMailAddressHere < /logs/backupDB.log
