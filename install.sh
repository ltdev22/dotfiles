#!/bin/sh


echo "Setting up your MacOS..."


# Install apps via Homebrew
./homebrew.sh


# Remove .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles directory
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Symlink gitconfig to home dir
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig


# Create a directory for the repositories
mkdir $HOME/Repositories


# Setup a new ssh key for Github (Note: make sure this script will run last)
./ssh.sh