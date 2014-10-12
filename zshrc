# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export EDITOR='mvim -f'
export GEM_EDITOR='mvim'
export BUNDLER_EDITOR='mvim'
export NODE_PATH='/usr/local/lib/node'

code=~/Dropbox/code

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="random"

# export ZSH_THEME="josh"
# export ZSH_THEME="zhann"
# export ZSH_THEME="edvardm"
# export ZSH_THEME="robbyrussell"
# export ZSH_THEME="jad"

POWERLINE_HIDE_HOST_NAME="true"
# POWERLINE_HIDE_USER_NAME="true"
# POWERLINE_DISABLE_RPROMPT="true"
POWERLINE_NO_BLANK_LINE="true"
export ZSH_THEME="powerline"

set -o dvorak

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem rails osx bundler pow)
# vi-mode removed due to Mavericks issue...

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

source ~/.zsh/aliases
[[ -f ~/.zsh/local ]] && source ~/.zsh/local

setopt auto_cd
cdpath=($HOME/Dropbox/code)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH="/Users/zef/Dropbox/code/dotfiles/bin:$PATH"

eval "$(rbenv init -)"

# Faster ruby: https://gist.github.com/1688857
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_GC_HEAP_FREE_SLOTS=200000
export RUBY_FREE_MIN=200000 # same as above, for pre ruby 2.1.0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
