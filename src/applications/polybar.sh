#!/bin/bash

install_polybar_source () {
    sudo apt -y install build-essential cmake cmake-data git i3-wm \
    libasound2-dev libcairo2-dev libcurl4-openssl-dev libiw-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev libpulse-dev libxcb1-dev \
    libxcb-composite0-dev libxcb-cursor-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev libxcb-xrm-dev pkg-config python3-sphinx python3-xcbgen xcb xcb-proto

    cd /tmp/

    file_link="https://github.com$( wget "https://github.com/polybar/polybar/releases/latest" -q -O - | sed -ne 's@.*\(\/polybar\/polybar\/.*tar\)".*@\1@p' | head -1 )"
    file_name=$( basename $file_link )

    wget $file_link

    tar -xf $file_name -C /opt/

    cd /opt/polybar/

    mkdir ./build/
    cd ./build/

    cmake ..
    make -j$(nproc)

    sudo make install
}
