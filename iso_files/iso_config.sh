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

# Anaconda configuration (copied from Bluefin, massive thanks to them!)
# Install Anaconda, Webui if >= F42
SPECS=(
    "libblockdev-btrfs"
    "libblockdev-lvm"
    "libblockdev-dm"
    "anaconda-live"
    "firefox"
)
if [[ "$IMAGE_TAG" =~ lts ]]; then
    dnf config-manager --set-enabled centos-release-kmods-kernel
    dnf copr enable -y jreilly/anaconda-webui

    SPECS+=("anaconda-webui")
elif [[ "$(rpm -E %fedora)" -ge 42 ]]; then
    SPECS+=("anaconda-webui")
fi
dnf install -y "${SPECS[@]}"

dnf config-manager --set-disabled centos-hyperscale &>/dev/null || true

tee /etc/anaconda/profile.d/fizzyblue.conf <<'EOF'
# Anaconda configuration file for fizzyblue

[Profile]
# Define the profile.
profile_id = fizzyblue

[Profile Detection]
# Match os-release values
os_id = fedora

[Network]
default_on_boot = FIRST_WIRED_WITH_LINK

[Bootloader]
efi_dir = fedora
menu_auto_hide = True

[Storage]
default_scheme = BTRFS
btrfs_compression = zstd:1
default_partitioning =
    /     (min 1 GiB, max 70 GiB)
    /home (min 500 MiB, free 50 GiB)
    /var  (btrfs)

[User Interface]
custom_stylesheet = /usr/share/anaconda/pixmaps/silverblue/fedora-silverblue.css
hidden_spokes =
    NetworkSpoke
    PasswordSpoke
    UserSpoke
hidden_webui_pages =
    anaconda-screen-accounts

[Localization]
use_geolocation = False
EOF

# Interactive Kickstart
tee -a /usr/share/anaconda/interactive-defaults.ks <<EOF
ostreecontainer --url=$IMAGE_REF:$IMAGE_TAG --transport=containers-storage --no-signature-verification
%include /usr/share/anaconda/post-scripts/install-configure-upgrade.ks
%include /usr/share/anaconda/post-scripts/disable-fedora-flatpak.ks
%include /usr/share/anaconda/post-scripts/install-flatpaks.ks
EOF

# Signed Images
tee /usr/share/anaconda/post-scripts/install-configure-upgrade.ks <<EOF
%post --erroronfail
bootc switch --mutate-in-place --enforce-container-sigpolicy --transport registry $IMAGE_REF:$IMAGE_TAG
%end
EOF

# Disable Fedora Flatpak
tee /usr/share/anaconda/post-scripts/disable-fedora-flatpak.ks <<'EOF'
%post --erroronfail
systemctl disable flatpak-add-fedora-repos.service
%end
EOF

# Install Flatpaks
tee /usr/share/anaconda/post-scripts/install-flatpaks.ks <<'EOF'
%post --erroronfail --nochroot
deployment="$(ostree rev-parse --repo=/mnt/sysimage/ostree/repo ostree/0/1/0)"
target="/mnt/sysimage/ostree/deploy/default/deploy/$deployment.0/var/lib/"
mkdir -p "$target"
rsync -aAXUHKP /var/lib/flatpak "$target"
%end
EOF
