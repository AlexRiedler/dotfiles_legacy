# Dotfiles
My personal dotfiles, also uses fresh dotfile manager to handle install etc

## Installation

```shell
FRESH_LOCAL_SOURCE=AlexRiedler/dotfiles bash <(curl -sL get.freshshell.com)

# potentially need to run after:
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# Install my packages
~/.brew
```
