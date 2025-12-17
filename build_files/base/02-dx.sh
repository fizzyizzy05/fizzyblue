#!/bin/bash

set -ouex pipefail

# Install development software
dnf in -y \
    docker \
    python3-tkinter \
    python3-pip \
    flatpak-builder \
    libvirt \
    libvirt-nss \
    virt-manager

# Install Visual Studio
tee /etc/yum.repos.d/vscode.repo <<'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/vscode.repo
dnf -y install --enablerepo=code \
    code
