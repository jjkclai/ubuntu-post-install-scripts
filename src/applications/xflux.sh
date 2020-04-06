#!/bin/bash

install_xflux_archive () {
    cd /tmp/

    file_link=$( wget "https://justgetflux.com/linux.html" -q -O - | sed -ne 's@.*\(https:\/\/.*64.*\.tgz\)".*@\1@p' | head -1 )
    file_name=$( basename $file_link )

    wget $file_link

    mkdir /opt/xflux/
    tar -xf $file_name -C /opt/xflux/

    mkdir /opt/xflux/bin/
    ln -s /opt/xflux/xflux /opt/xflux/bin/xflux

    echo 'export PATH="/opt/xflux/bin:$PATH"' >> ~/.profile

    echo '[Desktop Entry]' >> /opt/xflux/xflux.desktop
    echo 'Version=1.0' >> /opt/xflux/xflux.desktop
    echo 'Name=xflux' >> /opt/xflux/xflux.desktop
    echo 'GenericName=xflux' >> /opt/xflux/xflux.desktop
    echo 'Comment=xflux' >> /opt/xflux/xflux.desktop
    echo 'Exec=/opt/xflux/bin/xflux' >> /opt/xflux/xflux.desktop
    echo 'Path=/opt/xflux/' >> /opt/xflux/xflux.desktop
    echo 'Icon=' >> /opt/xflux/xflux.desktop
    echo 'Terminal=false' >> /opt/xflux/xflux.desktop
    echo 'Type=Application' >> /opt/xflux/xflux.desktop
    echo 'Categories=Application' >> /opt/xflux/xflux.desktop
    echo 'StartupNotify=true' >> /opt/xflux/xflux.desktop

    desktop-file-install --dir=$HOME/.local/share/applications /opt/xflux/xflux.desktop
    update-desktop-database
}

install_xflux_archive
