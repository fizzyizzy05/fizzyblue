#!/bin/bash

set -ouex pipefail

# Copy over the base system files
dnf in -y \
    rsync

rsync -rvK /ctx/system_files/base/ /

# Remove firefox so we can use the flatpak
dnf rm -y firefox

# Install some terminal software
dnf in -y \
    fish \
    micro  