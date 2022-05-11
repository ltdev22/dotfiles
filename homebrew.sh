#!/bin/sh

echo "\n<< Starting Homebrew setup >>\n"

if test ! $(which brew); then
	echo "\nHomebrew doesn't exist. Continuing with install ..\n"
	xcode-select --install
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "\nHomebrew already exists. Skipping install..\n"
fi

echo "\n<< Updating Homebrew recipes and install brews >>\n"
brew update
brew bundle --verbose