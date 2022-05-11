#!/bin/sh

echo "\n<< Setting up your MacOS >>\n"

echo "\n<< Add symlinks for zshrc, zshenv and gitconfig to home directory >>\n"
# Remove .zshrc, .zshenv and .gitconfig from home directory, if they exist, and create a symlinks of them from the .dotfiles directory into home
rm -rf $HOME/{.zshrc, .zshenv, .gitconfig}
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Install apps via Homebrew
$DOTFILES/homebrew.sh
# $DOTFILES/vscode.sh

echo "\n<< Create the Repositories forlder >>\n"
# Create a directory for the repositories
mkdir $HOME/Repositories