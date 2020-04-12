#!/bin/bash

# Check for and install updates
sudo apt update && sudo apt upgrade -y

# Install required applications
sudo apt install -y git vim

# Remove Cloud-Init
echo 'datasource_list: [ None ]' | sudo -s tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
sudo apt-get purge cloud-init
sudo rm -rf /etc/cloud/; sudo rm -rf /var/lib/cloud/

# Reboot for changes to take affect
sudo reboot