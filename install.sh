#!/bin/bash
# Rule 1. must be idempotent

if [ "`echo $0 | cut -c1`" = "/" ]; then
    DOTFILES_PATH=`dirname $0`
else
    DOTFILES_PATH=$(dirname `pwd`/`echo $0 | cut -c3-`)
fi

if [ -z ${GITHUB_TOKEN} ]; then
    echo "make sure you have a github token set."
    exit 1
fi

if [ -L ~/.screenrc ]; then
    unlink ~/.screenrc
fi

if [ -L ~/.gitconfig ]; then
    unlink ~/.gitconfig
fi

if [ -L ~/.ssh/config ]; then
    unlink ~/.ssh/config
fi

if [ -L ~/.tmux.conf ]; then
    unlink ~/.tmux.conf
fi

if [ -L ~/.inputrc ]; then
    unlink ~/.inputrc
fi

if [ -L ~/.crawl/init.txt ]; then
    unlink ~/.inputrc
fi

mkdir -p ~/.crawl
ln -s ${DOTFILES_PATH}/gitconfig ${HOME}/.gitconfig
ln -s ${DOTFILES_PATH}/screenrc ${HOME}/.screenrc
ln -s ${DOTFILES_PATH}/sshconfig ${HOME}/.ssh/config
ln -s ${DOTFILES_PATH}/tmux.conf ${HOME}/.tmux.conf
ln -s ${DOTFILES_PATH}/inputrc ${HOME}/.inputrc
ln -s ${DOTFILES_PATH}/crawl.txt ${HOME}/.crawl/init.txt
git config --global core.excludesfile ${DOTFILES_PATH}/gitignore

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 10

cat > ${HOME}/.zshrc <<eom
ZSH_CUSTOM=${DOTFILES_PATH}/zsh/custom
source ${DOTFILES_PATH}/zsh/zshrc.zsh
eom

echo "https://${GITHUB_TOKEN}:x-oauth-basic@github.com" > ~/.git-credentials
