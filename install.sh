#!/bin/bash

sudo apt install -y keepassx tmux curl i3 zsh owncloud-client feh i3blocks rofi fzf

# installing only office desktop
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
sudo apt update
sudo apt install onlyoffice-desktopeditors

# isntalling brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# You have to press enter for this to install
cd Documents
git clone https://github.com/neovim/neovim
cd neovim
git checkout release-0.7
sudo make CMAKE_BUILD_TYPE=Release
sudo make install
cd ../..

cd ~
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# sudo add-apt-repository -y ppa:neovim-ppa/unstable
# sudo apt update
# sudo apt install -y neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Do you wish to install all config files?"

read installConfigs

if $installConfigs == "y"
then
	# run symlink script
    ./symlink
fi
