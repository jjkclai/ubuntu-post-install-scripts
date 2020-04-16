#!/bin/bash

# change the working directory to home
cd

# change permissions of /opt
sudo chown -R $USER:$USER /opt/

# enable uncomplicated firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# update and upgrade from apt
sudo apt update
sudo apt -y upgrade

# install packages from apt
sudo apt -y install ofono pavucontrol ubuntu-desktop ubuntu-restricted-extras ibus-chewing tlp tlp-rdw \
    linux-headers-$(uname -r) linux-tools-$( uname -r ) mokutil xinput-calibrator lm-sensors hddtemp \
    build-essential make pkg-config dkms gcc default-jre default-jdk golang-go perl git csh tcsh tree nano xdotool grabc \
    i3 feh numlockx

# install programs in applications folder
for s in ./applications/*.sh; do
    bash $s
done

# import dotfiles
ln -s `readlink -f ./dotfiles/home.hidden` ~/.hidden

mkdir ~/.config/i3/
ln -s `readlink -f ./dotfiles/i3.config` ~/.config/i3/config

mkdir ~/.config/polybar/
ln -s `readlink -f ./dotfiles/polybar.config` ~/.config/polybar/config

mkdir ~/.config/polybar/scripts/
for s in ./polybar/*.sh; do
    ln -s `readlink -f $s` ~/.config/polybar/scripts/`basename $s`
done
