#!/bin/sh

# Source helper functions
if [[ -n "$DOTFILES" && -f "$DOTFILES/helpers" ]]; then
  source "$DOTFILES/helpers"
else
  source "$(dirname "$0")/helpers"
fi

print_info ">> Starting Homebrew setup ..."

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  print_info "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  print_info " Xcode Command Line Tools already installed."
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Install all our dependencies with bundle (See Brewfile)
print_info "Updating Homebrew recipes and install all brews (packages) from Brewfile ..."
brew update
brew tap homebrew/bundle
brew bundle --verbose --file $DOTFILES/Brewfile

# Remove outdated versions from the cellar.
brew cleanup
