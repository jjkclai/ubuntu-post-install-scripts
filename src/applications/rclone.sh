#!/bin/bash

install_rclone_archive () {
    cd /tmp/

    file_link=$( wget "https://rclone.org/downloads/" -q -O - | sed -ne 's@.*\(https:\/\/.*linux-amd64\.zip\)".*@\1@p' | head -1 )
    file_name=$( basename $file_link )

    wget $file_link

    unzip $file_name
    
    cp -r /tmp/rclone*amd64/ /opt/rclone

    mkdir /opt/rclone/bin/
    ln -s /opt/rclone/rclone /opt/rclone/bin/rclone

    echo 'export PATH="/opt/rclone/bin:$PATH"' >> ~/.profile

    echo '[Desktop Entry]' >> /opt/rclone/rclone.desktop
    echo 'Version=1.0' >> /opt/rclone/rclone.desktop
    echo 'Name=Rclone' >> /opt/rclone/rclone.desktop
    echo 'GenericName=Rclone' >> /opt/rclone/rclone.desktop
    echo 'Comment=Rclone' >> /opt/rclone/rclone.desktop
    echo 'Exec=/opt/rclone/bin/rclone' >> /opt/rclone/rclone.desktop
    echo 'Path=/opt/rclone/' >> /opt/rclone/rclone.desktop
    echo 'Icon=' >> /opt/rclone/rclone.desktop
    echo 'Terminal=false' >> /opt/rclone/rclone.desktop
    echo 'Type=Application' >> /opt/rclone/rclone.desktop
    echo 'Categories=Application' >> /opt/rclone/rclone.desktop
    echo 'StartupNotify=true' >> /opt/rclone/rclone.desktop

    desktop-file-install --dir=$HOME/.local/share/applications /opt/rclone/rclone.desktop
    update-desktop-database
}

install_rclone_archive
