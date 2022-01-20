#!/bin/bash

cd ~/git/dotfiles

cp -r ~/.config/{polybar,i3,picom,rofi,spotify-tui,vim/vimrc,vim/colors} ./
cp ~/.zshrc ./zshrc
cp -r ~/.todo ./todo
cp ~/bin/backup-dotfiles.sh ./

git add *
git commit -m "Backup $(date "+%Y-%m-%d %H:%M")"
git status
git push origin
