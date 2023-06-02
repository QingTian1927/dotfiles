#!/bin/sh

if [ "$(whoami)" != "root" ]; then
	echo "Please rerun the script as root/"
	exit 1
fi

username=""
aur_helper=""

while getopts u:a: flag
do
	case "${flag}" in
		u) username=${OPTARG};;
		a) aur_helper=${OPTARG};;
		*) echo "Invalid arguments: $(flag)" && exit 22;;
	esac
done

if [ -z "$username" ] || [ -z "$aur_helper" ]; then
	username=$(users | cut -d' ' -f 1)
	aur_helper="yay"
fi

home_dir=/home/$username
work_dir=$(pwd)

cd $work_dir/config/
cp -rv $(ls -A) $home_dir 

cd $work_dir/etc/
cp -rv $(ls -A) $home_dir

if [ ! -d "/usr/share/wallpapers" ]; then
	mkdir /usr/share/wallpapers
fi
cp -v "$home_dir"/Pictures/Wallpapers/* /usr/share/wallpapers/

if [ ! -d "/usr/share/logins" ]; then
	mkdir /usr/share/logins
fi
cp -v "$home_dir"/Pictures/TCG_Icons/* /usr/share/logins/


desk_env="dunst lightdm lightdm-gtk-greeter lxsession picom polybar qtile rofi zsh zsh-completions zsh-syntax-highlighting"

sys_utils="brightnessctl btop gprename kdeconnect keepassxc kitty pulsemixer redshift"

eye_candies="gtk-engine-murrine lightdm-gtk-greeter-settings lxappearance nitrogen papirus-icon-theme qt5ct"

file_utils="ffmpegthumbnailer gvfs gvfs-mtp mpv pcmanfm rhythmbox"

editors="codespell neovim python-pylint python-pynvim"

x11_utils="xarchiver xclip xscreensaver"

aur_pkgs="brave-bin catppuccin-gtk-theme-mocha librewolf-bin qt5-styleplugins shellcheck-bin slimbookbattery"

pacman -Syyu --noconfirm $desk_env $sys_utils $eye_candies $file_utils $editors $x11_utils

sudo --user=$username yay -S --noconfirm --clean --removemake --cleanafter --sudoloop --answerclean A --answerdiff N $aur_pkgs


echo "Changing shell to zsh for $(whoami)"
chsh -s "$(which zsh)" "$(whoami)"

echo "Adding 'QT_QPA_PLATFORMTHEME=qt5ct' to /etc/environment"
echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment 

echo "Enabling lightdm systemd service"
systemctl enable lightdm.service


echo "Configuring papirus-folders catppuccin theme"
if [ ! -d "$home_dir/clones" ]; then
	mkdir "$home_dir/clones"
fi
cd  "$home_dir/clones" || exit

git clone https://github.com/catppuccin/papirus-folders && cd papirus-folders || exit
cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-green --theme Papirus-Dark
cd "$work_dir" || exit
