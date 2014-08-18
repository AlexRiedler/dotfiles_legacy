# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set fish_greeting ""

# Theme
set fish_theme agnoster
#bira
#toaster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins autojump bundler brew node python rbenv rvm sublime tmux extract virtual

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

alias vim="nvim"
alias gst="git status"
alias gco="git checkout"
alias gp="git pull"

# NOTE: There is probably a sexier nicer way to do this, but until I figure that out I am manually unsetting here.
# Unsets PATH
set -g -x PATH

# This allows us to use Homebrew versions of things (like git) rather than the pre-installed or XCode installed versions.
# See http://blog.grayghostvisuals.com/git/how-to-keep-git-updated/ for reference.
set -g -x PATH $PATH /usr/local/bin

# Sets necessary PATH defaults
set -g -x PATH $PATH /usr/bin /bin /usr/sbin /sbin

# add neovim
set -g -x PATH $PATH /usr/local/Cellar/neovim/HEAD/bin

set -g -x PATH ~/bin /usr/local/opt/coreutils/libexec/gnubin nodule_modules/.bin $HOME/node_modules/.bin $PATH ~/gocode/bin

set -g -x GOPATH ~/gocode

set -g -x VIMRUNTIME /usr/local/Cellar/vim/7.4.335/share/vim/vim74

set -g -x PYTHONDONTWRITEBYTECODE 1

source ~/.oh-my-fish/plugins/virtual/virtual.fish
source ~/.fresh/build/shell.sh

ulimit -n 8192
