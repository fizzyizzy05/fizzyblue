#!/bin/bash

set -ouex pipefail

# Copy over the base system files
dnf in -y \
    rsync

rsync -rvK /ctx/system_files/base/ /

# Install some terminal software
dnf in -y \
    fish \
    micro  

# Install starship
dnf copr enable -y atim/starship
dnf in -y starship
dnf copr disable -y atim/starship