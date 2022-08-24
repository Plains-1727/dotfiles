#!/bin/bash

cd ~/.dotfiles

paths=(
    ".profile"
    ".zshrc"
    ".i3workspaceconfig"
    ".xinitrc"
    ".Xresources"
    ".gitconfig"
    ".config/i3"
    ".config/polybar"
    ".config/peaclock"
    ".config/picom"
    ".config/rofi"
    ".config/nvim"
    ".config/Thunar"
    ".config/ranger"
    ".config/starship.toml"
    "bin"
    "Documents/knowledge"
    ".fonts"
)

for path in "${paths[@]}"
do
    full_path="$HOME/${path}"

    if [ -e $full_path ]; then
        cp -rvf $full_path ~/.dotfiles/
    else
        echo "File ${full_path} does not exist"
    fi
done


#git add .
#git commit -m "Backup $(date "+%Y-%m-%d %H:%M")"
#git status
#git push origin
