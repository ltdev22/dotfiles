#!/bin/sh


echo "\n<< 1. Starting Homebrew setup >>\n"


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
	xcode-select --install
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Update Homebrew recipes
brew update


# Install
GIT_VERSION="$(git --version)"
if [ "$GIT_VERSION" == "command not found" ]; then
	brew install git
fi


# Install cask apps
brew tap homebrew/cask-versions
brew install --cask firefox-developer-edition

brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask github
brew install --cask insomnia
brew install --cask tableplus
brew install --cask spotify
brew install --cask whatsapp
brew install --cask messenger