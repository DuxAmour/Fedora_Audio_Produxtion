#!/bin/bash   Fedora_Audio_setup.sh

sudo dnf update -y

sudo dnf upgrade -y

sudo dnf group update "core" -y
###################################################################################################
                                  figlet "rpmfusion free & non free Repository"
####################################################################################################
sudo dnf install \https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install \https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y



sudo dnf install lightdm -y

sudo dnf install xorg-x11-server-Xorg xorg-x11-server-common xhost

sudo systemctl enable lightdm

sudo systemctl set-default graphical.target

sudo dnf install nano ark -y

sudo dnf install neofetch git figlet gcc fish -y

sudo dnf install compton nitrogen polybar -y

sudo dnf install cairo-dock alacritty kitty -y

sudo dnf install thunar

sudo dnf install openbox obconf -y

sudo dnf group install "Sound and Video"

sudo dnf group install "Window Managers"

sudo dnf install fontsawesome-fonts fontsawesome-fonts-web -y

figlet "Finished Base System!"
neofetch

###################################################################################################
                                  figlet "CCRMA Repository"
####################################################################################################

rpm -Uvh
http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetccrma/$(rpm -E %fedora)/x86_64/planetccrma-repo-1.1-3.fc$(rpm -E %fedora).ccrma.noarch.rpm
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install jack-audio-connection-kit qjackctl -y
sudo usermod -a -G jackuser <xubdux>
