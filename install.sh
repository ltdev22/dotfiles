#!/bin/sh


echo "Setting up your MacOS..."


# Install apps via Homebrew
./homebrew.sh


# Remove .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles directory
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

