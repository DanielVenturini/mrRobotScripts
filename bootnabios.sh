entrar como sudo

fdisk -l
mkdir /mnt/hd
mount /dev/sda1 /mnt/hd/
nano /mnt/hd/passwd
capitaodoapito:x:0:0:...home/capitaodoapito:/bin/bash
add user capitaodoapito
cat/etc/shadow
nano mnt/hd/etc/shadow
# colar chave
sync
reboot