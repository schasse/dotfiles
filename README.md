# Schasse Dot Files

Forked from [Ryan Bates' dotfiles](https://github.com/ryanb/dotfiles) and changed to my needs.

See also [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) and [Prelude](https://github.com/bbatsov/prelude)

## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/schasse/dotfiles/blob/master/Rakefile) to see exactly what it does.

```terminal
git clone git://github.com/schasse/dotfiles ~/.dotfiles
cd ~/.dotfiles
scrip/install_packages
scrip/install_dotfiles
```

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.zshrc
unlink ~/.tmux.conf
rm -rf ~/.tmux
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
rm -rf ~/.emacs.d
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.
