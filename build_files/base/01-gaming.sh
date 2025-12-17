#!/bin/bash

set -ouex pipefail

# Install launchers
dnf in -y \
    steam \
    lutris

# Install tools
dnf in -y \
    mangohud \
    gamescope