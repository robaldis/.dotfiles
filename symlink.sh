#!/bin/bash
echo "Removing existing config files/directories"

# Remove all the old config files
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux_conf
rm -rf ~/.config/nvim
rm -rf ~/.config/i3

echo "Linking the new config files"

ln -s ~/.dotfiles/.zshrc ~/
ln -s ~/.dotfiles/.gitconfig ~/
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/.config/nvim/ ~/.config/
ln -s ~/.dotfiles/.config/i3/ ~/.config/


# Making zsh defulat terminal
sudo chsh -s /bin/zsh
