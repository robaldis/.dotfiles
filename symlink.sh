#!/bin/bash

STOW_FOLDERS="i3,nvim,tmux,zsh,scripts"
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do 
    echo "stow $folder"
    stow -D $folder
done
    
# Making zsh defulat terminal
sudo chsh -s /bin/zsh
