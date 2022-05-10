# dotfiles (WIP)
My env set up. Based on the repositories: [https://github.com/alexgarrettsmith/dotfiles](https://github.com/alexgarrettsmith/dotfiles), [https://github.com/driesvints/dotfiles](https://github.com/driesvints/dotfiles), [https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos](https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos)


## Installation

[Generate a new public and private SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:
```
curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```

Clone this repo to `~/.dotfiles` with:

either https
```
$ git clone https://github.com/ltdev22/dotfiles.git ~/.dotfiles
```

or ssh
```
$ git clone git@github.com:ltdev22/dotfiles.git ~/.dotfiles
```

Run the installation with:

```
~/.dotfiles/install.sh
```