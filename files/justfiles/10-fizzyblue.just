# Install Visual Studio Code from uBlue's Homebrew tap
[group('Software')]
install-visual-studio-code:
    #!/bin/bash
    brew tap ublue-os/tap
    brew install --cask visual-studio-code-linux

# Install Jetbrains Toolbox from uBlue's Homebrew tap
[group('Software')]
install-jetbrains-toolbox:
    #!/bin/bash
    brew tap ublue-os/tap
    brew install --cask jetbrains-toolbox-linux

# Configure GDM to use the Monitor settings from the current user
[group('Features')]
gdm-monitor-setup:
    #!/bin/bash
    sudo cp /home/$(whoami)/.config/monitors.xml /etc/xdg/monitors.xml
