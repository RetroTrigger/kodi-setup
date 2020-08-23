#!/bin/bash 

# Create A User And Add Privileges
sudo adduser --disabled-password --gecos "" user
sudo usermod -a -G cdrom,video,plugdev,users,dialout,dip,input,netdev user

# Adding Program PPAs
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:team-xbmc/ppa -y

# Get the latest package lists and install the programs
sudo apt-get update -y
sudo apt-get install kodi openbox lightdm unzip flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

# Install Kodi-Openbox Xsession
wget -O openbox-kodi-master.zip https://github.com/lufinkey/kodi-openbox/archive/master.zip
unzip openbox-master.zip
cd kodi-openbox-master
bash ./build.sh
sudo dpkg -i kodi-openbox.deb

# Enable auto login in LightDM
cd ~/kodi-setup
cp -r lightdm.conf /etc/lightdm/lightdm.conf

# Install Moonlight
flatpak install flathub com.moonlight_stream.Moonlight

sudo reboot