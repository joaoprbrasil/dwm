#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

message() {
    echo -e "${GREEN}==> $*${NC}"
}

message 'Starting the Setup Installation...'

# 1. dependencies
message 'Installing packages...'
sudo pacman -S --noconfirm base-devel git \
    xorg-server xorg-xinit \
    alacritty \
    feh \
    picom \
    dmenu \
    network-manager-applet \
    volumeicon pavucontrol \
    pipewire pipewire-pulse pipewire-alsa \
    lxappearance papirus-icon-theme \
    ttf-jetbrains-mono-nerd terminus-font \
    htop btop scrot fastfetch \
    neovim nano

message 'Copying configuration files...'
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
mkdir -p ~/.config/fastfetch
mkdir -p ~/wallpapers

cp configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp configs/picom/picom.conf ~/.config/picom/picom.conf
cp wallpapers/wallpaper.jpg ~/wallpapers/wallpaper.jpg

# 2. dwm
message 'Compiling and Installing DWM...'
sudo make clean install

# 3. Slstatus
message 'Downloading, installing and Setuping the Slstatus...'

DWM_DIR=$(pwd)

mkdir -p ~/suckless
cd ~/suckless

if [ -d "slstatus" ]; then
    echo "Slstatus folder found. Updating..."
    cd slstatus
    git pull
else
    echo "Cloning Slstatus..."
    git clone https://git.suckless.org/slstatus
    cd slstatus
fi

echo "Injecting custom config..."
cp "$DWM_DIR/configs/slstatus/config.h" config.h
sudo make clean install

# Return to home directory to configure dotfiles
cd $HOME
message 'Configuring startup files (Universal Method)...'

# -----------------------------------------------------------
# STEP A: Create .xprofile (Startup Applications)
# -----------------------------------------------------------
message 'Generating .xprofile...'

cat > ~/.xprofile <<EOF
feh --bg-scale ~/wallpapers/wallpaper.jpg &
picom -b &
nm-applet &
volumeicon &
slstatus &
EOF

# -----------------------------------------------------------
# STEP B: Create .xinitrc
# -----------------------------------------------------------
message 'Configuring .xinitrc..'

cat > ~/.xinitrc <<EOF
#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "\$f" ] && . "\$f"
  done
  unset f
fi

[ -f \$HOME/.xprofile ] && . \$HOME/.xprofile

exec dwm
EOF

chmod +x .xinitrc

message 'Installation Completed Successfully!'
echo "You can now restart your system or log out."
