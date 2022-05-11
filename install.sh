#!/bin/sh

echo "Setting up your MacOS..."

# Install apps via Homebrew
./homebrew.sh

# Remove .zshrcfrom home directory, if it exists, and create a symlink of the .zshrc file from the .dotfiles directory into home
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
# .. same for .gitconfig
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

./vscode.sh

# Create a directory for the repositories
mkdir $HOME/Repositories