#!/bin/bash

date=$(date +"on-%d_%m_%Y-at-%H-%M")

mkdir -p /mnt/WD-2TB/Dropbox/ResearchMisc/Programming/Unix/Config_Files/EndeavourOS_BSPWM_Config/Desktop/config_"$date"
export dir=/mnt/WD-2TB/Dropbox/ResearchMisc/Programming/Unix/Config_Files/EndeavourOS_BSPWM_Config/Desktop/config_$date

###---bashrc---###
cp ~/.bashrc "$dir" && mv "$dir"/.bashrc "$dir"/bashrc

###---bash_profile---###
cp ~/.bash_profile "$dir" && mv "$dir"/.bash_profile "$dir"/bash_profile

###---ScreenLayout---###
cp -r /home/andrew/.screenlayout "$dir" && mv "$dir"/.screenlayout "$dir"/screenlayout

###---Config Files---###
mkdir -p "$dir"/config && export config=$dir/config
cp -r ~/.config/alacritty "$config"
cp -r ~/.config/bspwm "$config"
cp -r ~/.config/neofetch "$config"
cp -r ~/.config/nvim "$config"
cp -r ~/.config/polybar "$config"
cp -r ~/.config/sxhkd "$config"
cp -r ~/.config/picom/ "$config"
cp -r ~/.config/starship.toml "$config"
cp -r ~/.config/rofi "$config"

###---Scripts---###
cp -r ~/Scripts "$dir"

###---Fonts---###
mkdir -p "$dir"/local/share && export fonts=$dir/local/share
cp -r ~/.local/share/fonts "$fonts"

###---Backgrounds---###
cp -r /usr/share/backgrounds "$dir"

###---Installed Packages---###
pacman -Qet > "$dir"/package-list.txt
