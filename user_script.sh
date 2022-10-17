
#! /bin/bash

sudo groupadd marvel

counter=1
while read user
do
  sudo useradd $user
  sudo usermod -a -G marvel $user

  cat /etc/groups | grep marvel

  sudo mkdir /home/$user/secret
    while [ $counter -le 25 ]
      do
      sudo touch /home/$user/secret/$user$counter
    done
  sudo chmod 770 /home/$user/secret/*
done < user.txt
