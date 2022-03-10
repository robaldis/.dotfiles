#!/bin/bash
echo "Removing existing config files/directories"

# Remove all the old config files
rm -rf ~/.zshrc
rm -rf ~/.profile
rm -rf ~/.gitconfig
rm -rf ~/.tmux_conf
rm -rf ~/.config/nvim
rm -rf ~/.config/i3
rm -rf ~/.config/compton.conf
rm -rf ~/.Xresources

echo "Linking the new config files"

ln -s ~/.dotfiles/.zshrc ~/
ln -s ~/.dotfiles/.profile ~/
ln -s ~/.dotfiles/.gitconfig ~/
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/.config/nvim/ ~/.config/
ln -s ~/.dotfiles/.config/i3/ ~/.config/
ln -s ~/.dotfiles/.config/compton.conf ~/.config/
ln -s ~/.dotfiles/.Xresources ~/

# Making zsh defulat terminal
sudo chsh -s /bin/zsh
