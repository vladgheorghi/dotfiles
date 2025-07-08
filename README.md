# Backup Configuration Files for Arch Linux
This is my current public backup of the dotfiles on my Arch Linux setup. Most configurations and styles are taken from various people and modified to my personal preference. Enjoy! :)

## Dependencies
Make sure the following packages are installed for this dotfiles setup to function correctly:
### UI & Compositor
  - `hyprland` – dynamic Wayland compositor
  - `waybar` – highly customizable status bar for Wayland
  - `wlogout` – graphical logout menu for Wayland compositors
  - `wofi` – application launcher (dmenu-like for Wayland)

### Terminal & Shell
  - `kitty` – fast, GPU-based terminal emulator
  - `zsh` – powerful shell (used instead of bash)
  - `powerlevel10k` – theme for zsh
  - `oh-my-zsh` or `zinit` – (optional) Zsh plugin manager if you're using one
  - `bash` – fallback shell (for .bashrc)

### UI Theming
  - GTK 3 – required by most graphical applications (for .config/gtk-3.0 theming)
  - `dolphin` – KDE file manager (uses dolphinrc)

## Setup
  1. Fork the repository.
  2. Clone the repository.
  3. Install dependencies using `pacman`.
  4. Run `setup-scripts/create-symbolic-links.sh` to link repository files locally.

## Overview
![ss_2025-07-08_15-01-05](https://github.com/user-attachments/assets/0c84d9c3-90bb-4c4e-bf91-ecddb275dfbd)
![ss_2025-07-08_15-03-30](https://github.com/user-attachments/assets/19be6317-12f6-40b5-aab4-6b4c4cc33b3e)


