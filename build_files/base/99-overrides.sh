#!/bin/bash

set -ouex pipefail

# Remove preinstalled GNOME apps that end up being replaced
dnf remove -y \
    gnome-software \
    gnome-tour \
    gnome-system-monitor \
    yelp