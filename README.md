# fizzyblue
![A screenshot of a booted fizzyblue system](screenshot.png)
fizzyblue is a custom bootc image based on Fedora Silverblue, with a minimal, opinionated choice of included changes. It is tailored towards gaming, software development and day to day use. fizzyblue is a custom image for my own devices, but if the changes sound useful to you, you're welcome to try it. Most people should use [Bazzite](https://bazzite.gg), [Bluefin](https://projectbluefin.io) and [Aurora](https://getaurora.dev).

## Features
- Vanilla GNOME experience.
- Built on the latest release of Fedora.
- Homebrew pre-installed.
- Visual Studio Code pre-installed.
- Steam, Lutris and a variety of gaming tools included.

### Planned
- ISO images
- Preinstalled flatpaks
- Plasma and Niri/DMS versions

## How to use
Run this command on an installed bootc system to use fizzyblue. 
```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/fizzyizzy05/fizzyblue
```
