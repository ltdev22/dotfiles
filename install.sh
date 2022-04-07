#!/bin/sh


echo "Setting up your MacOS..."


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Remove .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles directory
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc


# Update Homebrew recipes
brew update


# Create a Repositories directory under Home
mkdir $HOME/Repositories