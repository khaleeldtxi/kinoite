#!/usr/bin/env bash

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

flatpak --user update --appstream
flatpak --user -y upgrade

flatpak --user -y install flathub \
	com.github.tchx84.Flatseal \
	com.google.Chrome \
        org.mozilla.firefox \
	io.mpv.Mpv \
	org.qbittorrent.qBittorrent \
	org.videolan.VLC \
	org.kde.kdenlive \
