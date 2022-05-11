
# I. Set Variables
export DOTFILES=$HOME/.dotfiles
# export HOMEBREW_CASK_OPTS="--no-quarantine" # disables MacOS's Gatekeeper when installing brew casks (apps)


# II. Load functions and aliases
source $DOTFILES/.functions
source $DOTFILES/.aliases


# III. Add locations to $PATH Variable

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # add VS Code binary (code)


# IV. Utilities

# show Git branch name on prompt
export PROMPT='%F{yellow}%n@%m %F{green}%1~ %F{magenta}$(parse_git_branch)
%F{normal}%# '
