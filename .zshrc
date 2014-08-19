# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.zsh

# Set theme to load for ZSH
export ZSH_THEME="agnoster"

# Disable weekly auto-update for oh-my-zsh
export DISABLE_AUTO_UPDATE="true"

# List of ZSH plugins to load
plugins=(git vi-mode zsh-syntax-highlighting history-substring-search extract)

# Load ZSH
source $ZSH/oh-my-zsh.sh

# Setup normal path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make TMUX be happy about the type of term in use
export TERM='xterm-256color'
export TERM='screen-256color'

#
# GENERAL ALIASES
#

# turn off auto-correct for the annoying stuff
alias cp='nocorrect cp '
alias mv='nocorrect mv '
alias mkdir='nocorrect mkdir '

# Useful Aliases
alias f='find . | grep'
alias ls="ls -G --color --group-directories-first"

# Mac OS X tool aliases
alias sublime='open -a "Sublime Text"'

# coreutils (for mac os x - gnu utils)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#
# GIT
#

# faster auto-complete (use local) for git files
__git_files () {
    _wanted files expl 'local files' _files
}

#
# RUBY
#

alias b='bundle'

# Ruby performance optimizations
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

# setup RVM
source ~/.rvm/scripts/rvm

# mysql dynamic client connector lib issues (http://stackoverflow.com/questions/8049643/rails-mysql2-lion-fatal-failed-to-allocate-memory/9064253#9064253)
#export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.5.27/lib/:$DYLD_LIBRARY_PATH
# $ sudo env ARCHFLAGS="-arch x86_64" gem install mysql2 -v '0.3.11' -- --with-mysql-config=/usr/local/Cellar/mysql/5.5.27/bin/mysql_config"
#
# JAVA
#

export JAVA_HOME=$(/usr/libexec/java_home)
alias mvn=mvnc.sh

#
# PYTHON
#

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONDONTWRITEBYTECODE=1 # disable .pyc files
export WORKON_HOME=$HOME/.virtualenvs # setup virtualenv wrapper
source /usr/local/bin/virtualenvwrapper.sh

# autocomplete for fab
_fab_list() {
  reply=(`fab --shortlist`)
}
compctl -K _fab_list fab

#
# NODE
#

export PATH=node_modules/.bin:${PATH} # node.js modules

#
# EDITOR
#

# Auto-Editor
export EDITOR=nvim
alias -s html=$EDITOR
alias -s erb=$EDITOR
alias -s haml=$EDITOR
alias -s css=$EDITOR
alias -s scss=$EDITOR
alias -s sass=$EDITOR
alias -s coffee=$EDITOR
alias -s js=$EDITOR
alias -s py=$EDITOR
alias -s cat="pygemntize -g"

# setup vim runtime for nvim
export VIMRUNTIME=/usr/local/Cellar/vim/7.3.266/share/vim/vim73 nvim

#
# MISC
#

# set ulimits
ulimit -n 8192

# disable accents on MacOSX
defaults write -g ApplePressAndHoldEnabled -bool false

# RVM likes to be first...
export PATH=$HOME/.rvm/bin:/usr/local/git/bin:$PATH:/usr/local/sbin
