#!/bin/bash

#---------------------------------
# Munki Setup
#---------------------------------

sudo apt update
sudo apt upgrade -y
sudo apt install curl build-essential nginx apache2-utils samba -y

sudo mkdir /usr/local/munki_repo
sudo mkdir -p /etc/nginx/sites-enabled/
ln -s /usr/local/munki_repo/ ~/
cd /usr/local/munki_repo
sudo mkdir catalogs client_resources icons manifests pkgs pkgsinfo

sudo addgroup --system munki
sudo adduser --system munki --ingroup munki
sudo usermod -a -G munki $USER # Adds the current console user to munki group
sudo usermod -a -G munki www-data # Adds web user to munki group
sudo chown -R $USER:munki /usr/local/munki_repo
sudo chmod -R 2774 /usr/local/munki_repo