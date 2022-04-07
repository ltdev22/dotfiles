# . ~/.aliases

# Functions
mkcd() {
    mkdir -p "$@" && cd "$_"
}

# Show Git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
setopt PROMPT_SUBST

export PROMPT='%F{black}%n@%m %F{blue}%c %F{magenta}$(parse_git_branch) %F{normal}%% '
