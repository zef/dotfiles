# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export EDITOR='mvim -f'
export GEM_OPEN_EDITOR='mvim'
export BUNDLER_EDITOR='mvim'
export NODE_PATH='/usr/local/lib/node'

code=~/code

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="random"

# export ZSH_THEME="josh"
# export ZSH_THEME="zhann"
export ZSH_THEME="edvardm"

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
plugins=(git rvm gem rails3 osx bundler pow)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/aliases
[[ -f ~/.zsh/local ]] && source ~/.zsh/local

setopt auto_cd
cdpath=($HOME/code)

# Customize to your needs...
export PATH=/Users/zef/code/executables:/opt/local/bin:/opt/local/sbin:/usr/local/graphviz-2.14/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/mongodb/bin:/Users/zef/rails/scripts/executables:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# uncomment to install certain Rubies with RVM
# export CC=/usr/bin/gcc-4.2

PATH=$PATH:$HOME/.rvm/bin
