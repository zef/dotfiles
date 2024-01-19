# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -f'
  export GEM_EDITOR='mvim'
  export BUNDLER_EDITOR='mvim'
fi

export NODE_PATH='/usr/local/lib/node'

code=~/code

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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# vi-mode removed due to Mavericks issue... trying it again
# old things I used but now removed:
# pow bundler rails gem osx

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

source ~/.zsh/aliases
[[ -f ~/.zsh/local ]] && source ~/.zsh/local

setopt auto_cd
cdpath=($HOME/code)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH="/Users/zef/code/dotfiles/bin:$PATH"
export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"
export PATH="/Library/TeX/texbin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"

# Faster ruby: https://gist.github.com/1688857
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_GC_HEAP_FREE_SLOTS=200000


# export GOPATH=$HOME/golang
# export PATH=$PATH:$GOPATH/bin
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOROOT/bin


export PATH="$HOME/.fastlane/bin:$PATH"

# GoLang
export GOROOT=/Users/zef/code/verse/FBTT/go-ssb-bindings/.goroot
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/zef/go
export PATH=$GOPATH/bin:$PATH

# added by Particle CLI
# add home bin directory to PATH if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# https://stackoverflow.com/questions/64799841/how-to-stop-docker-and-kubernetes-using-docker-desktop
# macro to kill the docker desktop app and the VM (excluding vmnetd -> it's a service)
# function kdo() {
#   ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
# }

