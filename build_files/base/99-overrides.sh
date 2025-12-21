#!/bin/bash

set -ouex pipefail

# Remove preinstalled GNOME apps that end up being replaced
dnf remove -y \
    gnome-software \
    gnome-tour \
    gnome-system-monitor \
    yelp

# Setup the rechunker-group-fix for people coming from images using the old HHD rechunker
chmod +x /usr/bin/rechunker-group-fix
systemctl enable rechunker-group-fix.service