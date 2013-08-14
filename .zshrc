#
# OH MY ZSH SETUP
#

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.zsh

# Set theme to load for ZSH
export ZSH_THEME="ultrahex"

# Use case-sensitive auto-completion
# export CASE_SENSITIVE="true"

# Disable weekly auto-update for oh-my-zsh
export DISABLE_AUTO_UPDATE="true"

# List of ZSH plugins to load
plugins=(git vi-mode urxvt zsh-syntax-highlighting history-substring-search extract)

# Load ZSH
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make TMUX be happy about the type of term in use
export TERM='xterm-256color'
export TERM='screen-256color'

#
# PYTHON
#

export PATH=$HOME/.rvm/bin:/usr/local/git/bin:$PATH:/usr/local/sbin # Add RVM to PATH for scripting
export PATH=$PATH:/Users/ariedler/Library/Haskell/ghc-7.4.2/lib/minions-0.2.0.0/bin
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

#
# GIT
#

# faster auto-complete (use local) for git files
__git_files () {
    _wanted files expl 'local files' _files
}

#
# GENERAL ALIASES
#

# turn off auto-correct for the annoying stuff
alias cp='nocorrect cp '
alias mv='nocorrect mv '
alias mkdir='nocorrect mkdir '

# Useful Aliases
alias f='find . | grep'

# Auto-Editor
export EDITOR=vim
alias -s html=$EDITOR
alias -s erb=$EDITOR
alias -s haml=$EDITOR
alias -s css=$EDITOR
alias -s scss=$EDITOR
alias -s sass=$EDITOR
alias -s coffee=$EDITOR
alias -s js=$EDITOR
alias -s cat="pygemntize -g"

# Scala Build Tool - Memory Size Options
export SBT_OPTS=-XX:MaxPermSize=256m

# Mac OS X tool aliases
alias sublime='open -a "Sublime Text 2"'

# Tools
# pip install httpie

# add 'brew install coreutils' (GNU utils) to the start of the $PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#
# RUBY
#

alias b='bundle'
source ~/.rvm/scripts/rvm

# Ruby performance optimizations
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

# mysql dynamic client connector lib issues (http://stackoverflow.com/questions/8049643/rails-mysql2-lion-fatal-failed-to-allocate-memory/9064253#9064253)
#export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.5.27/lib/:$DYLD_LIBRARY_PATH
# $ sudo env ARCHFLAGS="-arch x86_64" gem install mysql2 -v '0.3.11' -- --with-mysql-config=/usr/local/Cellar/mysql/5.5.27/bin/mysql_config"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/X11/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.8

alias ls="ls -G --color --group-directories-first"

ulimit -n 8192
