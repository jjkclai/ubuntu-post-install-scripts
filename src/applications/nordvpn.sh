#!/bin/bash

install_nordvpn_deb () {
    cd /tmp/

    wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    sudo dpkg -i nordvpn-release_1.0.0_all.deb

    sudo apt update
    sudo apt -y install nordvpn
}

install_nordvpn_deb

configure_nordvpn () {
    nordvpn login

    nordvpn set cybersec on
    nordvpn set killswitch on
    nordvpn set autoconnect on
    nordvpn set notify on

    nordvpn connect
}

configure_nordvpn
