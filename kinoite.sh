#!/usr/bin/env bash

sudo tee -a /etc/sudoers <<EOT
Defaults !tty_tickets
EOT

# Enable automatic updates
sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
sudo sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf
systemctl enable rpm-ostreed-automatic.timer
rpm-ostree reload
systemctl enable rpm-ostreed-automatic.timer --now

# https://coreos.github.io/rpm-ostree/countme/
systemctl mask --now rpm-ostree-countme.timer

# Disable NetworkManager-wait-online.service
systemctl disable NetworkManager-wait-online.service

# Change the hostname
echo "New hostname name, the default value being 'fedora':"
read -r HOSTNAME_NEW
hostnamectl set-hostname "$HOSTNAME_NEW"

rpm-ostree install zsh distrobox --apply-live
sudo usermod -s /bin/zsh "$USER"

    
rpm-ostree override remove firefox firefox-langpacks -r
