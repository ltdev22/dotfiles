# dotfiles

#### Homebrew:
To see sub-commands
```
$ brew help
```

For more casks, formulaes etc refer to the [official Homebrew website](https://formulae.brew.sh/) and add them to the Brewfile or (preferred way) after installing each cask or brew etc, run within the repo
```
$ brew bundle --verbose
```
This will update the _Brewfile_ with the latest changes.

#### VS Code & Sublime Text
VS Code's settings sync is probably the way to go for keeping track of all extensions, themes and settings I have, so no need to backing up them in the repo and copying them to the appropriate paths after VS code's installation. I keep though a backup as well of them in [my gists](https://gist.github.com/ltdev22), just in case :)

TODO: For Sublime Text not sure there's a settings sync available, this process needs to be implemented.

#### Bookmarks and extensions/add-ons for web browser (Firefox)
Firefox offers the ability to sync all these through the Mozila account I have, so like with VS Code there's no need to do anything within the repo. Same thing probably applies and for Google Chrome.

## Installation

Clone this repo to `~/.dotfiles`
```
$ git clone git@github.com:ltdev22/dotfiles.git ~/.dotfiles

// if no ssh used
$ git clone https://github.com/ltdev22/dotfiles.git ~/.dotfiles
```

[Generate a new public and private SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:
```
$ curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```

Run the installation script
```
$ ~/.dotfiles/install.sh
```