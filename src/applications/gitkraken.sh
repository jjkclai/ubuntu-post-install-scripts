#!/bin/bash

install_gitkraken_snap () {
    sudo snap install gitkraken
}

install_gitkraken_deb () {
    cd /tmp/
    
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    sudo dpkg -i gitkraken-amd64.deb
}

install_gitkraken_archive () {
    cd /tmp/

    file_link=$( wget "https://www.gitkraken.com/download/linux-gzip" -q -O - | sed -ne 's@.*\(https:\/\/.*tar\.gz\).*@\1@p' | head -1 )
    file_name=$( basename $file_link )

    wget $file_link

    tar -xf $file_name -C /opt/

    mkdir /opt/gitkraken/bin/
    ln -s /opt/gitkraken/gitkraken /opt/gitkraken/bin/gitkraken

    echo 'export PATH="/opt/gitkraken/bin:$PATH"' >> ~/.profile

    echo '[Desktop Entry]' >> /opt/gitkraken/gitkraken.desktop
    echo 'Version=1.0' >> /opt/gitkraken/gitkraken.desktop
    echo 'Name=GitKraken' >> /opt/gitkraken/gitkraken.desktop
    echo 'GenericName=GitKraken' >> /opt/gitkraken/gitkraken.desktop
    echo 'Comment=GitKraken' >> /opt/gitkraken/gitkraken.desktop
    echo 'Exec=/opt/gitkraken/bin/gitkraken' >> /opt/gitkraken/gitkraken.desktop
    echo 'Path=/opt/gitkraken/' >> /opt/gitkraken/gitkraken.desktop
    echo 'Icon=' >> /opt/gitkraken/gitkraken.desktop
    echo 'Terminal=false' >> /opt/gitkraken/gitkraken.desktop
    echo 'Type=Application' >> /opt/gitkraken/gitkraken.desktop
    echo 'Categories=Application' >> /opt/gitkraken/gitkraken.desktop
    echo 'StartupNotify=true' >> /opt/gitkraken/gitkraken.desktop

    desktop-file-install --dir=$HOME/.local/share/applications /opt/gitkraken/gitkraken.desktop
    update-desktop-database
}

install_gitkraken_archive
