#!/bin/bash

set -ouex pipefail

# Install the base system packages
/ctx/build_files/base/00-base.sh

# Install the gaming packages
/ctx/build_files/base/01-gaming.sh