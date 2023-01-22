#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap daipeihust/tap
brew tap felixkratz/formulae

# Brew Formulae
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install tree
brew install neovim
brew install wget
brew install jq
brew install ripgrep
brew install rename
brew install neofetch
brew install sketchybar
brew install svim
brew install lazygit
brew install fzf
brew install wrk
brew install tmux
brew install im-select
brew install yabai
brew install skhd

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask item2
brew install --cask ngrok
brew install --cask sf-symbols
brew install --cask fig
brew install --cask karabiner-elements

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1480933944 #Vimari

# Config Files
echo "Linking Config Files"
ln -s ./.config/nvim $HOME/.config/nvim
ln -s ./.config/svim $HOME/.config/svim
ln -s ./.config/sketchybar $HOME/.config/sketchybar

# Start Services
echo "Starting Services (grant permissions)..."
brew services start svim
brew services start sketchybar
brew services start yabai
brew services start skhd
