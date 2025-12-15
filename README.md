# DWM Setup (Nebula/Neon Theme)
<img width="1900" height="946" alt="print_fetch_001" src="https://github.com/user-attachments/assets/97dd1a6e-477e-4fc0-9475-647a78ecc7fa" />
<img width="1900" height="946" alt="print_tops_000" src="https://github.com/user-attachments/assets/d1a8149d-fb94-4317-a01a-56bf9ef5aa2b" />
<img width="1900" height="946" alt="print_tops2" src="https://github.com/user-attachments/assets/a549bd42-bb46-48c1-94b8-c1349e980959" />

# FAQ
This repository contains the dotfiles and source code (forks) required to replicate a Arch Linux desktop environment, built around the DWM. The goal is to transform a basic Arch system into a highly productive, aesthetically cohesive (Orange Neon/Nebula Theme), and lightweight environment using just one installation script.

## Highlights & Included Tools

| Category | Component | Detail |
| :--- | :--- | :--- |
| **Window Manager** | DWM (Suckless) | Configured with gaps patches and focused on window control. |
| **Status Bar** | slstatus | Displays system status (volume, network, etc.) in a minimalist way. |
| **Terminal** | Alacritty | Dark theme, **JetBrains Mono Nerd Font** set to Bold for a "Neon Glow" orange/white effect. |
| **Compositor** | Picom | Enabled for Transparency and smooth shadows. |
| **Monitoring** | btop / htop | Stylized system resource monitors. |
| **System Info** | Fastfetch | Displays system specifications with the Arch logo on launch. |
| **Visuals** | feh / Papirus | Wallpaper management and Modern Icon Theme. |

## Prerequisites

This script is designed to be executed on a clean, basic installation of **Arch Linux** with a configured user and internet connectivity.

## Automated Installation Guide

Git is the only manual dependency required to download the repository.
```bash
sudo pacman -S git
```


### Installation 
```bash
git clone https://github.com/joaoprbrasil/dwm
cd dwm
chmod +x install.sh && ./install.sh
```

After the script finishes and displays the success message, reboot the system and start the DWM session:
```bash
startx
```


