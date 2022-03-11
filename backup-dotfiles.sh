#!/bin/bash

cd ~/.dotfiles

paths=(
    ".profile"
    ".zshrc"
    ".i3workspaceconfig"
    ".xinitrc"
    ".Xresources"
    ".config/i3"
    ".config/polybar"
    ".config/peaclock"
    ".config/picom"
    ".config/rofi"
    ".config/nvim"
    "bin/backup-dotfiles.sh"
)

for p in "${paths[@]}"
do
    cp -rf ~/$p ~/.dotfiles/
done


#git add .
#git commit -m "Backup $(date "+%Y-%m-%d %H:%M")"
#git status
#git push origin
