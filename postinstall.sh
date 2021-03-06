#!/bin/bash

echo "                                                             "
echo "██╗   ██╗██████╗ ██╗██╗  ██╗ ██████╗ ██████╗ ██████╗ ███████╗"
echo "██║   ██║██╔══██╗██║██║ ██╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝"
echo "██║   ██║██████╔╝██║█████╔╝ ██║     ██║   ██║██║  ██║█████╗  "
echo "██║   ██║██╔══██╗██║██╔═██╗ ██║     ██║   ██║██║  ██║██╔══╝  "
echo "╚██████╔╝██████╔╝██║██║  ██╗╚██████╗╚██████╔╝██████╔╝███████╗"
echo " ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝"

echo "┬ ┬┌─┐┬─┐┬┌─  ┌─┐┬  ┌─┐┌─┐┌─┐"
echo "││││ │├┬┘├┴┐  ├─┘│  ├─┤│  ├┤ "
echo "└┴┘└─┘┴└─┴ ┴  ┴  ┴─┘┴ ┴└─┘└─┘"

echo "┌─┐┌─┐┌┬┐┬ ┬┌─┐"
echo "└─┐├┤  │ │ │├─┘"
echo "└─┘└─┘ ┴ └─┘┴  "
echo "               "

sudo -s

mkdir ~/.temp
cd ~/.temp

echo "+--------------------------------------+"
echo "|       ...update and upgrade...       |"
echo "+--------------------------------------+"

apt update && apt upgrade -y && apt autoremove -y

echo "+--------------------------------------+"
echo "|        ...installing ppa's...        |"
echo "+--------------------------------------+"

apt install software-properties-common -y

echo "+--------------------------------------+"
echo "|     ...installing Xorg server...     |"
echo "+--------------------------------------+"

apt install xorg -y

echo "+--------------------------------------+"
echo "|       ...installing lightDm...       |"
echo "+--------------------------------------+"

apt install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings -y

echo "+--------------------------------------+"
echo "|        ...installing i3wm...         |"
echo "+--------------------------------------+"

apt install i3 -y

echo "+--------------------------------------+"
echo "|   ...installing gnome terminal...    |"
echo "+--------------------------------------+"

apt install gnome-terminal -y

echo "+--------------------------------------+"
echo "|     ...installing basic stuff...     |"
echo "+--------------------------------------+"

apt install curl wget git htop nmap mc -y
 
echo "+--------------------------------------+"
echo "|       ...installing thunar...        |"
echo "+--------------------------------------+"

apt install thunar -y

echo "+--------------------------------------+"
echo "|   ...installing zsh and ohmyzsh...   |"
echo "+--------------------------------------+"

apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "+--------------------------------------+"
echo "|        ...installing fonts...        |"
echo "+--------------------------------------+"

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

cp fonts.zip ~/
cd ~/
unzip fonts.zip
rm fonts.zip
cd .temp

echo "+--------------------------------------+"
echo "|        ...installing tools...        |"
echo "+--------------------------------------+"

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs
apt install -y build-essential

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update && apt install code-insiders

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

wget https://sourceforge.net/projects/stacer/files/v1.0.8/stacer_1.0.8_amd64.deb
sudo dpkg -i stacer_1.0.8_amd64.deb
rm -r stacer_1.0.8_amd64.deb

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
rm -r gitkraken-amd64.deb


add-apt-repository ppa:ubuntuhandbook1/corebird -y
add-apt-repository ppa:mozilla-daily/ppa -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
add-apt-repository ppa:dawidd0811/neofetch-daily -y
add-apt-repository ppa:papirus/papirus -y

apt update

apt install firefox-trunk remmina remmina-plugin-rdp libfreerdp-plugins-standard corebird neofetch papirus-icon-theme -y

reboot
