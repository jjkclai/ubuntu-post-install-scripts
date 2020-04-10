#!/bin/bash

install_veracrypt_archive () {
    cd /tmp/

    file_link=$( wget "https://www.veracrypt.fr/en/Downloads.html" -q -O - | sed -ne 's@.*\(https:\/\/.*\.tar\.bz2\).*@\1@p' | sed -ne 's@&#43;@+@p' | head -1 )
    file_name=$( basename $file_link )

    wget $file_link

    tar -xf /tmp/$file_name
    
    bash /tmp/veracrypt*gui*64

    mkdir /opt/veracrypt/
    tar -xf /tmp/veracrypt*tar.gz -C /opt/veracrypt/

    cp -r /opt/veracrypt/usr/* /opt/veracrypt/
    rm -r /opt/veracrypt/usr/

    echo 'export PATH="/opt/veracrypt/bin:$PATH"' >> ~/.profile

    echo '[Desktop Entry]' >> /opt/veracrypt/veracrypt.desktop
    echo 'Version=1.0' >> /opt/veracrypt/veracrypt.desktop
    echo 'Name=Veracrypt' >> /opt/veracrypt/veracrypt.desktop
    echo 'GenericName=Veracrypt' >> /opt/veracrypt/veracrypt.desktop
    echo 'Comment=Veracrypt' >> /opt/veracrypt/veracrypt.desktop
    echo 'Exec=/opt/veracrypt/bin/veracrypt' >> /opt/veracrypt/veracrypt.desktop
    echo 'Path=/opt/veracrypt/' >> /opt/veracrypt/veracrypt.desktop
    echo 'Icon=' >> /opt/veracrypt/veracrypt.desktop
    echo 'Terminal=false' >> /opt/veracrypt/veracrypt.desktop
    echo 'Type=Application' >> /opt/veracrypt/veracrypt.desktop
    echo 'Categories=Application' >> /opt/veracrypt/veracrypt.desktop
    echo 'StartupNotify=true' >> /opt/veracrypt/veracrypt.desktop

    desktop-file-install --dir=$HOME/.local/share/applications /opt/veracrypt/veracrypt.desktop
    update-desktop-database
}
