# dotfiles

This is the set up for my dev environment I have for my Macbook. Based on repositories such as [alexgarrettsmith](https://github.com/alexgarrettsmith/dotfiles), [Dries Vints](https://github.com/driesvints/dotfiles) and [kevinSuttle](https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos), as well as the training course from Udemy [Dotfiles from Start to Finish-ish](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/) and the [official dotfiles documentation](https://dotfiles.github.io/tutorials/).

## Additional info

#### 1. For Homebrew:
For more casks, formulaes etc refer to the [official Homebrew website](https://formulae.brew.sh/) and add them to the Brewfile or (preferred way) after installing each cask or brew etc, run within the repo
```
brew bundle --verbose
```
This will update the _Brewfile_ with the latest changes.

#### 2. For MacOS settings
The settings on the [repository of Dries Vints](https://github.com/driesvints/dotfiles/blob/main/.macos) is the closest thing to a published list that exists as far as I have found, however still looking for other available params I could use in these commands to have the macos configuration fully automated (e.g. hide Recents, AirDrop, Music, Videos, Tags and Locations from the sidebar on Finder, setting Firefox as a default browser etc).

I haven't copied all the file from this repository, rather decided to copy only specific commands for the settings I want.

#### 3. VS Code & Sublime Text
VS Code's settings sync is probably the way to go for keeping track of all extensions, themes and settings I have, so no need to backing up them in the repo and copying them to the appropriate paths after VS code's installation. I keep though a backup as well of them in [my gists](https://gist.github.com/ltdev22), just in case :)

TODO: For Sublime Text not sure there's a settings sync available, this process needs to be implemented.

#### 4. Bookmarks and extensions/add-ons for web browser (Firefox)
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
curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```

Run the installation script
```
~/.dotfiles/install.sh
```