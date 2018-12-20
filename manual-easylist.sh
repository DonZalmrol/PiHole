
#!/bin/bash

# Cleanup log
rm -f /logs/manual-easylist.log

# Set mailbody
echo -e "\nThis script will download and update PiHole with the latest EasyList updates" >> /logs/manual-easylist.log

# Change directory
cd /scripts/

# Loop over the URLs in the lists.lst file
echo -e "\nDownloading sources..." >> /logs/manual-easylist.log
for source in `cat lists.lst`; do
        echo $source;
        curl --silent $source >> /tmp/ads.txt
        echo -e "\t`wc -l /tmp/ads.txt | cut -d " " -f 1` lines downloaded for $source" >> /logs/manual-easylist.log
done

# Filter out the non-url content
echo -e "\nFiltering non-url content..." >> /logs/manual-easylist.log
perl easylist.pl /tmp/ads.txt > /tmp/ads_parsed.txt
rm /tmp/ads.txt
echo -e "\t`wc -l /tmp/ads_parsed.txt | cut -d " " -f 1` lines after parsing" >> /logs/manual-easylist.log

# Remove duplicates from the parsed list
echo -e "\nRemoving duplicates..." >> /logs/manual-easylist.log
sort -u /tmp/ads_parsed.txt > /tmp/ads_unique.txt
rm /tmp/ads_parsed.txt
echo -e "\t`wc -l /tmp/ads_unique.txt | cut -d " " -f 1` lines after deduping" >> /logs/manual-easylist.log

# Create unique list
cat /tmp/ads_unique.txt >> /etc/pihole/blacklist.txt
sort -u /etc/pihole/blacklist.txt > /etc/pihole/blacklist.txt2
rm /etc/pihole/blacklist.txt
mv /etc/pihole/blacklist.txt2 /etc/pihole/blacklist.txt
rm /tmp/ads_unique.txt

# Update Pi-Hole gravity
echo -e "\nRunning PiHole update" >> /logs/manual-easylist.log
sudo pihole -g >> /logs/manual-easylist.log
echo -e "\nUpdate completed" >> /logs/manual-easylist.log

# Send mail
mail -s "Easylist updater results" yourMailAddressHere < /logs/manual-easylist.log

# Exit the code gracefully
exit 0
