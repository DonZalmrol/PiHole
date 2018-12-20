#!/bin/bash

# Cleanup log
rm -f /logs/splitLongTermDB.log

# Set mailbody
echo -e "\nThis script will split the PiHole DB for long term storage" >> /logs/splitLongTermDB.log

echo -e "\nStop FTL"  >> /logs/splitLongTermDB.log
sudo service pihole-FTL stop

echo -e "\nSplit DB"  >> /logs/splitLongTermDB.log
sudo mv /etc/pihole/pihole-FTL.db /media/backup/pihole-FTL_$(date +"%m-%y").db

echo -e "\nStart FTL"  >> /logs/splitLongTermDB.log
sudo service pihole-FTL start

echo -e "\nSplitting completed"  >> /logs/splitLongTermDB.log

# Send mail
mail -s "Split DB results" YourMailAddressHere < /logs/splitLongTermDB.log
