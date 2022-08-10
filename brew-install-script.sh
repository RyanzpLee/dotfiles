#!/bin/sh

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap homebrew/cask

echo "Installing programming stuff"
brew install python3
brew install docker
brew install git
brew install node
brew install nvm
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask google-chrome
brew install --cask slack
brew install --cask kitty
brew install fzf
brew install bat
brew install ripgrep
brew install neovim
brew install z
brew install jq
brew install antibody
brew install --cask font-jet
brew install font-jetbrains-mono-nerd-font
brew install antibody
brew install lazygit
brew install --cask postman
