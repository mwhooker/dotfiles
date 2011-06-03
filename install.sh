#!/bin/bash

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

ln -s ${DOTFILES_PATH}/gitconfig ${HOME}/.gitconfig
ln -s ${DOTFILES_PATH}/screenrc ${HOME}/.screenrc
git config --global core.excludesfile ${DOTFILES_PATH}/gitignore
