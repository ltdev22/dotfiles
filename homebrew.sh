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


brew bundle --verbose