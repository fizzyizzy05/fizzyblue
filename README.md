# fizzyblue
fizzyblue is a custom bootc image for desktops and laptops based on Fedora Silverblue, designed to offer a better developer and gaming experience, while retaining a cleaner desktop setup.

fizzyblue is a personal project, expect limited support and more frequent changes compared to a more popular image such as [Bazzite](https://bazzite.gg) or [Bluefin](https://projectbluefin.io), which also have much larger maintainance teams and communities.

## Screenshot
![A screenshot of a booted fizzyblue system. It is a GNOME desktop with the overview open, showing Firefox, GNOME Calendar, Vesktop, Firefox, Terminal, Steam, Visual Studio Code and Bazaar on the bottom Dash](screenshot.png)

## Features
- Built on the latest stable release of Fedora, currently **43**. Major upgrades should happen within the release week.
- Near-vanilla GNOME experience; minor changes to the default appearance, shortcuts and a few default app substitutions:
    - Firefox (as a flatpak) instead of GNOME Web
    - Bazaar instead of GNOME Software
    - Resources instead of GNOME System Monitor
- [uupd](https://github.com/ublue-os/uupd) included and enabled by default for automatic and universal updates.
- Flatpaks are provided through Flathub. Fedora Flatpaks are specifically not included out of the box, due to overall being poor quality.
- Homebrew, fish and starship included for a better CLI.
- Visual Studio Code, virt-manager and [foundry](https://gitlab.gnome.org/foundry) included for software development. 
- Docker and Podman are both included to support a variety of workflows.
- Steam and Lutris included for easy access to games, without dealing with Flatpak limitations.
- Additional gaming tools pre-installed such as gamescope, MangoHUD, ProtonPlus and more.
- Support for Turing and newer Nvidia cards with the `fizzyblue-nvidia` image. 
- Fix for the legacy rechunker used by uBlue images for seamless and reliable rebasing.

## How to use
### Rebasing
Run one of the following commands on an installed bootc system (based on the GPU) and reboot to use fizzyblue:
#### fizzyblue (GNOME)
```bash
# AMD/Intel GPUs
sudo bootc switch --enforce-container-sigpolicy ghcr.io/fizzyizzy05/fizzyblue
# Turing (GTX 16xx/RTX 20xx) or newer Nvidia GPUs
sudo bootc switch --enforce-container-sigpolicy ghcr.io/fizzyizzy05/fizzyblue-nvidia
```
It's recommended to stick to the desktop environment you have currently installed on your system, e.g. **fizzyblue** for Bluefin, Bazzite GNOME, or Silverblue; or **fizzyblue-kinoite** for Aurora, Bazzite KDE and Kinoite.
### Clean installs
Alternatively, ISOs are built on the 1st of the month, or sooner if major changes are made to justify it, and are [available for download from GitHub Actions](https://github.com/fizzyizzy05/fizzyblue/actions/workflows/build-iso.yml) for clean installs. Select the latest workflow and download the fizzyblue.iso.zip artifact.

These ISOs are currently built on the `fizzyblue` image; Nvidia users should rebase post-install using the above command.

## Credits
fizzyblue is made possible thanks to the work of:
- **BlueBuild**: for creating the base images and easy tooling to work with.
- **Universal Blue**: Titanoboa for making ISOs, and general inspiration and other parts.
- **Fedora Silverblue**: the ultimate base upon which fizzyblue is built off for packages and software.
- **GNOME**: for providing a great desktop environment to include in fizzyblue.
- And many other projects and individuals!
