
# Setting Variables
export DOTFILES=$HOME/.dotfiles
export HOMEBREW_CASK_OPTS="--no-quarantine" # disables MacOS's Gatekeeper when installing brew casks (apps)


# Loading aliases and any useful functions
source $DOTFILES/.functions
source $DOTFILES/.aliases


# Adding locations to $path array. This is similar to $PATH Variable, 
# however using the $path array instead PATH, as doing this below:
#     export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# would cause duplicate entries in $PATH
typeset -aU path
path=(
    $path
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)


# Showing the Git branch name on prompt in a nice formatted way
export PROMPT='%F{yellow}%n@%m %F{green}%1~ %F{magenta}$(parse_git_branch)
%F{normal}%# '
