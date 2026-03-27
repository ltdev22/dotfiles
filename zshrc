# Source environment variables
[[ -f "$HOME/.dotfiles/variables" ]] && source "$HOME/.dotfiles/variables"

# Syntax highlighting for man pages using bat
if command -v bat >/dev/null 2>&1; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Enable colors
autoload -U colors && colors


# Check if DOTFILES directory exists before sourcing and then source the functions and aliases files if they exist
if [[ -d "$DOTFILES" ]]; then
    [[ -f "$DOTFILES/functions" ]] && source "$DOTFILES/functions"
    [[ -f "$DOTFILES/aliases" ]] && source "$DOTFILES/aliases"
else
    echo "Warning: DOTFILES directory not found at $DOTFILES"
fi


# Adding locations to $PATH Variable
# Check if we're in zsh to use advanced features
if [[ -n "$ZSH_VERSION" ]]; then
    # Use zsh-specific path array to avoid duplicates
    typeset -aU path
    path=(
        $path
        "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    )
else
    # Fallback for other shells
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# add personal helper locations so executables are available in every project
path+=(
    "$HOME/.php"          # global PHP wrapper
)

# Showing the Git branch name on prompt in a nice formatted way
export PROMPT='%F{yellow}%n@%m %F{green}%~ %F{magenta}$(parse_git_branch)%f
%# '
