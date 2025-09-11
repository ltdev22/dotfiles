#!/bin/sh

echo "\n Starting Homebrew setup \n"

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "\n Xcode Command Line Tools not found. Installing... \n "
  xcode-select --install
else
  echo "\n Xcode Command Line Tools already installed. \n "
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Install all our dependencies with bundle (See Brewfile)
echo "\n Updating Homebrew recipes and install brews (packages) \n"
brew update
brew tap homebrew/bundle
brew bundle --verbose --file ./Brewfile