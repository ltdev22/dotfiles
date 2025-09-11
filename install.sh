#!/bin/sh

# Set DOTFILES variable early
export DOTFILES=$HOME/.dotfiles

# Source helper functions
source "$DOTFILES/helpers"


print_header "Setting up your MacBook with dotfiles"


# Remove .zshrc and .gitconfig from home directory, if they exist, and create a symlinks of them from the .dotfiles directory into home
print_info ">> Adding symlinks for zshrc and gitconfig to home directory"
rm -rf $HOME/{.zshrc,.gitconfig}
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
print_success "Symlinks created successfully!"

# Install apps via Homebrew
print_info ">> Installing required apps via Homebrew"
source $DOTFILES/brew.sh
print_success "Homebrew has installed all required apps successfully!"

# Create a directory for cloning all my repositories
print_info ">> Creating the Repositories forlder in Home directory"
mkdir $HOME/Repositories
print_success "The Repositories folder has been created successfully!"


# Source the new .zshrc to apply changes
print_info ">> Finally sourcing new .zshrc"
source $HOME/.zshrc
print_header "Setup Complete!"
print_success "Your MacBook has been configured with your dotfiles"
echo -e "\n${GREEN}🎉 Happy coding!${NC}\n"