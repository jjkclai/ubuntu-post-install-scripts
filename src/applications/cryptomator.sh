#!/bin/bash

install_cryptomator_appimage () {
    cd /tmp/

    file_link=$( wget "https://cryptomator.org/downloads/#linuxDownload" -q -O - | sed -ne 's@.*\(https:\/\/.*AppImage\).*@\1@p' | head -1 )
    file_name=$( basename $file_link )

    wget $file_link

    mkdir /opt/cryptomator
    cp -r /tmp/$file_name /opt/cryptomator/$file_name
    chmod u+x /opt/cryptomator/$file_name

    mkdir /opt/cryptomator/bin
    ln -s /opt/cryptomator/$file_name /opt/cryptomator/bin/cryptomator

    echo 'export PATH="/opt/cryptomator/bin:$PATH"' >> ~/.profile

    echo '[Desktop Entry]' >> /opt/cryptomator/cryptomator.desktop
    echo 'Version=1.0' >> /opt/cryptomator/cryptomator.desktop
    echo 'Name=Cryptomator' >> /opt/cryptomator/cryptomator.desktop
    echo 'GenericName=Cryptomator' >> /opt/cryptomator/cryptomator.desktop
    echo 'Comment=Cryptomator' >> /opt/cryptomator/cryptomator.desktop
    echo 'Exec=/opt/cryptomator/bin/cryptomator' >> /opt/cryptomator/cryptomator.desktop
    echo 'Path=/opt/cryptomator/' >> /opt/cryptomator/cryptomator.desktop
    echo 'Icon=' >> /opt/cryptomator/cryptomator.desktop
    echo 'Terminal=false' >> /opt/cryptomator/cryptomator.desktop
    echo 'Type=Application' >> /opt/cryptomator/cryptomator.desktop
    echo 'Categories=Application' >> /opt/cryptomator/cryptomator.desktop
    echo 'StartupNotify=true' >> /opt/cryptomator/cryptomator.desktop

    desktop-file-install --dir=$HOME/.local/share/applications /opt/cryptomator/cryptomator.desktop
    update-desktop-database
}

install_cryptomator_appimage
