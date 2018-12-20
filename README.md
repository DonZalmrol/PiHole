# PiHole
Contains PiHole scripts

These are free for use. I gathered these scripts from different sites.

The scripts are edited to include better logging and sending out an e-mail to my admin account so I can see that it succeeded or not.

Contents is subject to change.

#BackupDB.sh
Will create a backup of the PiHole database.

#splitLongTermDB.sh
Rotates the PiHole DB so that it stays maintainable and light.

#Easylist.pl
Will filter and process the Easylist contents into a readable format (domainnames) for PiHole.

#Lists.lst
Contains my personal used Easylists that I've fetched from the Easylist site.

#Manual-easylist.sh
This is the updater tool that uses Easylist.pl and lists.lst and pushes the new Easylists to Pihole.

# Sources
Source 01 : https://www.reddit.com/r/pihole/comments/4p2tp7/adding_easylist_and_other_adblocklike_sources_to/
Source 02 : https://newspaint.wordpress.com/2014/08/18/filtering-easylist-for-hosts-file-style-adblock/
