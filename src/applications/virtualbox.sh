#!/bin/bash

install_virtualbox_apt () {
    sudo apt -y install virtualbox virtualbox-dkms virtualbox-guest-additions-iso menu vde2 libelf-dev
}

install_virtualbox_apt

configure_virtualbox () {
    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=Descriptive common name/"
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
    tail $(modinfo -n vboxdrv) | grep "Module signature appended"
    sudo mokutil --import MOK.der
}

configure_virtualbox
