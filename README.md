# PiHole
Contains PiHole scripts

These are free for use. I gathered these scripts from different sites.

The scripts are edited to include better logging and sending out an e-mail to my admin account so I can see that it succeeded or not.

Contents is subject to change.

# BackupDB.sh
BackupDB.sh will create a backup of the PiHole database.

# splitLongTermDB.sh
splitLongTermDB.sh rotates the PiHole DB so that it stays maintainable and light.

# Easylist.pl
Easylist.pl will filter and process the Easylist contents into a readable format (domainnames) for PiHole.

# Lists.lst
Lists.lst contains my personal used Easylists that I've fetched from the Easylist site.

# Manual-easylist.sh
Manual-easylist.sh is the updater tool that uses Easylist.pl and lists.lst and pushes the new Easylists to Pihole.
Edited so that it uses the local Unix temp storage.

# Used blocklists
Used blocklists contains the blocklists I use (including the default provided ones).

# Crontab schedule
#m      h       dom     mon     dow     command
0       0       1       *       *       /scripts/splitLongTermDB.sh
0       0       1       *       *       /scripts/backupDB.sh
0       1       *       *       *       /scripts/manual-easylist.sh

# Used Sources
Source 01 : https://www.reddit.com/r/pihole/comments/4p2tp7/adding_easylist_and_other_adblocklike_sources_to/
Source 02 : https://newspaint.wordpress.com/2014/08/18/filtering-easylist-for-hosts-file-style-adblock/
