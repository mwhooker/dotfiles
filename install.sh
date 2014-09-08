#!/bin/bash
# Rule 1. must be idempotent

if [ "`echo $0 | cut -c1`" = "/" ]; then
    DOTFILES_PATH=`dirname $0`
else
    DOTFILES_PATH=$(dirname `pwd`/`echo $0 | cut -c3-`)
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

ln -s ${DOTFILES_PATH}/gitconfig ${HOME}/.gitconfig
ln -s ${DOTFILES_PATH}/screenrc ${HOME}/.screenrc
ln -s ${DOTFILES_PATH}/sshconfig ${HOME}/.ssh/config
ln -s ${DOTFILES_PATH}/tmux.conf ${HOME}/.tmux.conf
ln -s ${DOTFILES_PATH}/inputrc ${HOME}/.inputrc
git config --global core.excludesfile ${DOTFILES_PATH}/gitignore

cat > ${HOME}/.zshrc <<eom
ZSH_CUSTOM=${DOTFILES_PATH}/zsh/custom
source ${DOTFILES_PATH}/zsh/zshrc.zsh
eom
