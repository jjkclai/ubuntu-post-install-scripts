#!/bin/bash

install_fontawesome_archive () {
    cd /tmp/

    file_link="https://github.com$( wget "https://github.com/ngdanghau/fontawesome-pro/releases/latest" -q -O - | sed -ne 's@.*\(\/ngdanghau\/fontawesome-pro\/.*zip\).*@\1@p' | head -1 )"
    file_name=$( basename $file_link )

    wget $file_link

    unzip $file_name
    unzip fontawesome*desktop.zip

    cp -r /tmp/fontawesome*desktop/otfs/*.otf ~/.local/share/fonts/

    fc-cache
}

install_fontawesome_archive
