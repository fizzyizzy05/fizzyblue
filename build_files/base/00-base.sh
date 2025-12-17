#!/bin/bash

set -ouex pipefail

# Remove firefox so we can use the flatpak
dnf rm -y firefox

# Install some terminal software
dnf in -y \
    fish \
    micro  