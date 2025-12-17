#!/bin/bash

set -ouex pipefail

# Install the base system packages
/ctx/build_files/base/00-base.sh

# Install the gaming packages
/ctx/build_files/base/01-gaming.sh

# Install the dev software packages.
/ctx/build_files/base/02-dx.sh

# Overrides/removals from base Fedora
/ctx/build_files/base/99-overrides.sh