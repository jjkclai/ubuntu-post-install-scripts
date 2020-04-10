#!/bin/bash

install_virtualbox_apt () {
    sudo apt -y install virtualbox virtualbox-dkms virtualbox-guest-additions-iso menu vde2 libelf-dev
}

install_virtualbox_apt
