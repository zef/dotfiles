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
export ZSH_THEME="robbyrussell"

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
plugins=(git gem rails3 osx bundler pow)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

source ~/.zsh/aliases
[[ -f ~/.zsh/local ]] && source ~/.zsh/local

setopt auto_cd
cdpath=($HOME/Dropbox/code)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

eval "$(rbenv init -)"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
