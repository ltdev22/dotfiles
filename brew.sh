#!/bin/sh

# Source environment variables if DOTFILES is not already set
[ -z "$DOTFILES" ] && source "$(dirname "$0")/variables"

# Source helper functions
if [ -n "$DOTFILES" ] && [ -f "$DOTFILES/helpers" ]; then
  source "$DOTFILES/helpers"
else
  source "$(dirname "$0")/helpers"
fi

print_info "👉 Starting Homebrew setup .."

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  print_info "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
  print_info "Please complete the installation dialog, then press [Enter] to continue"
  read -r _   # wait for user
  until xcode-select -p &>/dev/null; do
    sleep 1
  done
else
  print_info " Xcode Command Line Tools already installed."
fi

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# on Apple‑Silicon Homebrew lives in /opt/homebrew; on Intel it’s /usr/local
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Install all our dependencies with bundle (See Brewfile)
print_info "Updating Homebrew recipes and installing all brew packages from Brewfile ..."
brew update
brew upgrade       # bring existing bottles up to date
brew doctor        # warn about problems
brew tap homebrew/bundle
brew bundle --verbose --file "$DOTFILES/Brewfile"
brew cleanup # remove outdated versions from the cellar

print_info "Homebrew setup completed successfully! Don't forget to install Docker Desktop from the App Store if you haven't already."