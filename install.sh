#!/bin/sh

# Source environment variables
source "$HOME/.dotfiles/variables" || {
    echo "Error: Could not source variables file"
    exit 1
}

# Source helper functions
source "$DOTFILES/helpers" || { echo "Failed to source helpers"; exit 1; }


print_header "Setting up your MacBook with dotfiles ⏳"


# Install apps via Homebrew
print_info "👉 Installing required apps via Homebrew"
source "$DOTFILES/brew.sh" || { print_error "Homebrew installation failed"; exit 1; }
print_success "Homebrew has installed all required apps successfully!"


# Remove .zshrc and .gitconfig from home directory if they exist and create fresh symlinks of them from the .dotfiles directory into home directory
print_info "👉 Adding symlinks for zshrc and gitconfig to home directory"

print_info "Step 1: Backing up existing files .."
# Backup existing files if they exist
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$BACKUPS/zshrc.backup.$(date +%Y%m%d_%H%M%S)" && print_info "Backed up existing .zshrc"
[ -f "$HOME/.gitconfig" ] && mv "$HOME/.gitconfig" "$BACKUPS/gitconfig.backup.$(date +%Y%m%d_%H%M%S)" && print_info "Backed up existing .gitconfig"
print_success "Backups completed."

print_info "Step 2: Removing old symlinks and creating new ones .."
# remove each file individually (brace expansion won't work inside quotes)
rm -rf "$HOME/.zshrc" "$HOME/.gitconfig"
ln -s "$DOTFILES/zshrc" "$HOME/.zshrc" || { print_error "Failed to create .zshrc symlink"; exit 1; }
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig" || { print_error "Failed to create .gitconfig symlink"; exit 1; }
print_success "Symlinks created."


# Create a directory for cloning all my repositories
print_info "👉 Creating the Repositories folder in Home directory"
mkdir -p "$REPOS/_assets" || { print_error "Failed to create repositories directory"; exit 1; }
cp "$DOTFILES/vscode_php_docker" "$REPOS/_assets/vscode_php_docker" || { print_error "Failed to copy vscode_php_docker"; exit 1; }
chmod +x "$REPOS/_assets/vscode_php_docker" || { print_error "Failed to make vscode_php_docker executable"; exit 1; }
print_success "The Repositories folder has been created successfully!"


# Source the new .zshrc to apply changes
print_info ">> Finally sourcing new .zshrc"
source "$HOME/.zshrc" || { print_error "Failed to source .zshrc"; exit 1; }
print_header "Setup Complete! 🎉"
print_success "Your MacBook has been configured with dotfiles"
echo "\n${GREEN}🙌 Happy coding!${NC}\n"