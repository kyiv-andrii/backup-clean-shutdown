#!/bin/bash
#
# Shutdown script with backuping home directory and system cleaning
###################################################################

TEXT_YELLOW='\e[0;33m'
TEXT_GREEN_B='\e[1;32m'
TEXT_RESET='\e[0m'

# Backuping my work on another HDD
echo -e $TEXT_YELLOW
echo 'mount /dev/sdb2'
echo -e $TEXT_RESET
sudo mount -v /dev/sdb2 /media # Edit Path for your needs
echo '/dev/sdb2 is mounted at /media'

echo -e $TEXT_YELLOW
echo 'Backuping new and changed files'
echo -e $TEXT_RESET
sudo rsync -avzh --delete --exclude-from '/home/name/Dir/EXCLUDE-list.txt' /home/name/ /media/Dir # Edit Path for your needs
echo 'Backuping complete'

echo -e $TEXT_YELLOW
echo 'umount /dev/sdb2'
echo -e $TEXT_RESET
sudo umount -v /dev/sdb2 # Edit Path for your needs
echo '/dev/sdb2 is unmounted'

# Now cleaning the system
# Autoremove
echo -e $TEXT_YELLOW
echo 'Autoremove'
echo -e $TEXT_RESET
sudo apt autoremove
echo 'Autoremove complete'

# Autoclean
echo -e $TEXT_YELLOW
echo 'Autoclean'
echo -e $TEXT_RESET
sudo du -sh /var/cache/apt
sudo apt autoclean
echo 'Autoclean complete, cache is:'
sudo du -sh /var/cache/apt
echo -e $TEXT_YELLOW
date
echo 'System cleaning complete'
echo -e $TEXT_RESET

# And shutdown
sudo shutdown 1
echo -e $TEXT_YELLOW
echo 'The machine is waiting for a minute...'

exit
