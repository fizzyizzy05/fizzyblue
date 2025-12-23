#!/bin/bash

set -ouex pipefail

# Remove firefox so we can use the flatpak
dnf rm -y firefox

# Remove preinstalled GNOME apps that end up being replaced
dnf remove -y \
    gnome-software \
    gnome-tour \
    gnome-system-monitor \
    yelp

# Remove the GNOME Classic session and its related extensions
dnf remove -y \
    gnome-shell-extension-common \
    gnome-shell-extension-apps-menu- \
    gnome-shell-extension-launch-new-instance \
    gnome-shell-extension-places-menu \
    gnome-shell-extension-window-list \
    gnome-shell-extension-background-logo \
    gnome-shell-extension-appindicator

# Setup the rechunker-group-fix for people coming from images using the old HHD rechunker
chmod +x /usr/bin/rechunker-group-fix
systemctl enable rechunker-group-fix.service

# Build GNOME overrides
mkdir -p /tmp/bazzite-schema-test &&
find "/usr/share/glib-2.0/schemas/" -type f ! -name "*.gschema.override" -exec cp {} "/tmp/bazzite-schema-test/" \; 
cp "/usr/share/glib-2.0/schemas/zz0-"*".gschema.override" "/tmp/bazzite-schema-test/" 
glib-compile-schemas --strict /tmp/bazzite-schema-test 
glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null 

dconf update