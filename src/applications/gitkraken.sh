#!/bin/bash

install_gitkraken_snap () {
    sudo snap install gitkraken
}

install_gitkraken_deb () {
    cd /tmp/
    
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    sudo dpkg -i gitkraken-amd64.deb
}
