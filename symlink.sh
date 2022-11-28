#!/bin/bash

STOW_FOLDERS="bin,i3,nvim,tmux,zsh,scripts"
for foles in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do 
    echo "stow $folder"
    stow -D $folder
    stow $folder

# Making zsh defulat terminal
sudo chsh -s /bin/zsh
