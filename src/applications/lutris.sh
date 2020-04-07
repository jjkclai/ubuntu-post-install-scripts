#!/bin/bash

install_lutris_ppa () {
    sudo add-apt-repository ppa:lutris-team/lutris
    sudo apt update
    sudo apt -y install lutris
}

install_lutris_ppa
