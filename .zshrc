
# Set Variables
export DOTFILES=$HOME/.dotfiles
export HOMEBREW_CASK_OPTS="--no-quarantine"


# load functions and aliases
source $DOTFILES/.functions
source $DOTFILES/.aliases

# Show Git branch name
export PROMPT='%F{yellow}%n@%m %F{green}%1~ %F{magenta}$(parse_git_branch)
%F{normal}%# '