
# Set Variables
export DOTFILES=$HOME/.dotfiles
export HOMEBREW_CASK_OPTS="--no-quarantine"


# Set Functions

# mkdir && cd 
mkcd() {
    mkdir -p "$@" && cd "$_"
}


# use as e.g. exists brew && echo "exists" || echo "not exists" 
exists() {
    command -v $1 > /dev/null 2>&1
}


# Load the aliases 
source $DOTFILES/.aliases


# Show Git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
setopt PROMPT_SUBST

export PROMPT='%F{yellow}%n@%m %F{green}%c %F{magenta}$(parse_git_branch) 
%F{normal}%% '