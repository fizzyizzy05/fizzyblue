#!/bin/bash

set -ouex pipefail

dnf autoremove -y

# Remove a bunch of crap that isn't needed on the live iso
dnf remove -y \
    steam \
    lutris \
    mangohud \
    docker \
    python3-tkinter \
    python3-pip \
    flatpak-builder \
    libvirt \
    libvirt-nss \
    virt-manager \
    code
