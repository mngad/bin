sudo mount /dev/sdb1 /mnt/keys
rsync -qru --info=progress2 --exclude-from=/var/tmp/ignorelist /home/fraun /mnt/keys/Thinkpad_bak
sudo umount /dev/sdb1
