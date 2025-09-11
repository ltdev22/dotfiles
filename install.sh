#!/bin/sh

echo "\n >> Setting up your MacOS ... \n"

# Remove .zshrc and .gitconfig from home directory, if they exist, and create a symlinks of them from the .dotfiles directory into home
echo "\n >> Adding symlinks for zshrc and gitconfig to home directory ... \n"
rm -rf $HOME/{.zshrc, .gitconfig}
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
echo "\n Done! \n"

# Install apps via Homebrew
echo "\n >> Installing required apps via Homebrew ... \n"
source $DOTFILES/homebrew.sh
echo "\n Done! \n"

# Create a directory for cloning all my repositories
echo "\n >> Create the Repositories forlder ... \n"
mkdir $HOME/Repositories
echo "\n Done! \n"