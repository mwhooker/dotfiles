# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    aws
    awshelper
    bundler
    colored-man
    git
    glide
    go
    gpg-agent
    history
    last-working-dir
    lein
    mwhooker
    osx
    rbenv
    ssh-agent
    systemadmin
    urltools
    virtualenv
    z
)

unsetopt ALL_EXPORT

# User configuration

export GOPATH=$HOME/go

export PATH=/sbin:/usr/sbin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rbenv/bin:$HOME/bin

export HISTFILE=$HOME/.zhistory

export EDITOR=vim

PYSITE="$(python -m site --user-base)/bin"

if [ -f "${HOME}/Library/Haskell/bin" ]; then
    export PATH="${PATH}:${HOME}/Library/Haskell/bin:${PYSITE}"
fi

# fix ssh sign useing the key
# https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/201786
export SSH_AUTH_SOCK=0

#xcode 4 bullshit -
#http://stackoverflow.com/questions/5944332/broken-pipe-error-when-using-pip-to-install-pycrypto-on-mac-os-x
export ARCHFLAGS='-arch i386 -arch x86_64'

export DISPLAY=:0
export HOSTNAME="`hostname`"
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE=C
export PAGER='less'
export TZ="America/Los_Angeles"
export ENABLE_CORRECTION=true
export VIM_CRONTAB=true


bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh
set -o vi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

source "${0:a:h}/hashicorp"

export LESS="-Ri"

autoload -U zmv
