#!/bin/sh

# Set DOTFILES variable early
export DOTFILES=$HOME/.dotfiles

# Source helper functions
source "$DOTFILES/helpers" || { echo "Failed to source helpers"; exit 1; }


print_header "Setting up your MacBook with dotfiles ⏳"


# Remove .zshrc and .gitconfig from home directory if they exist and create fresh symlinks of them from the .dotfiles directory into home directory
print_info "👉 Adding symlinks for zshrc and gitconfig to home directory"

print_info "Step 1: Backing up existing files .."
# Backup existing files if they exist
mkdir -p $HOME/Documents/_dotfiles_backups
[[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/Documents/_dotfiles_backups/zshrc.backup.$(date +%Y%m%d_%H%M%S) && print_info "Backed up existing .zshrc"
[[ -f $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/Documents/_dotfiles_backups/gitconfig.backup.$(date +%Y%m%d_%H%M%S) && print_info "Backed up existing .gitconfig"
print_success "Backups completed."

print_info "Step 2: Removing old symlinks and creating new ones .."
rm -rf $HOME/{.zshrc,.gitconfig}
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
print_success "Symlinks created."

# Install apps via Homebrew
print_info "👉 Installing required apps via Homebrew"
source $DOTFILES/brew.sh || { print_error "Homebrew installation failed"; exit 1; }
print_success "Homebrew has installed all required apps successfully!"

# Create a directory for cloning all my repositories
print_info "👉 Creating the Repositories folder in Home directory"
mkdir -p $HOME/Repositories/_assets
cp vscode_php_docker $HOME/Repositories/_assets/vscode_php_docker
chmod +x $HOME/Repositories/_assets/vscode_php_docker
print_success "The Repositories folder has been created successfully!"


# Source the new .zshrc to apply changes
print_info ">> Finally sourcing new .zshrc"
source $HOME/.zshrc
print_header "Setup Complete! 🎉"
print_success "Your MacBook has been configured with dotfiles"
echo "\n${GREEN}🙌 Happy coding!${NC}\n"