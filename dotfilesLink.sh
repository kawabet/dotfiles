#!/bin/sh
# vim
# ln -sf $PWD/.vimrc ~/.vimrc
# ln -sf $PWD/indent ~/.vim
ln -sf $PWD/vim/vimrc ~/.vimrc
ln -sf $PWD/vim ~/.vim
# nvim
ln -sf $PWD/vim/vimrc ~/.config/nvim/init.vim
# ln -sf $PWD/vim ~/.config/nvim
# bash
ln -sf $PWD/.bash_profile ~/.bash_profile
ln -sf $PWD/.bashrc ~/.bashrc
# zsh
ln -sf $PWD/.zlogin ~/.zlogin
ln -sf $PWD/.zlogout ~/.zlogout
ln -sf $PWD/.zpreztorc ~/.zpreztorc
ln -sf $PWD/.zprofile ~/.zprofile
ln -sf $PWD/.zshenv ~/.zshenv
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/prezto ~/.zprezto
# mac
# ln -sf $PWD/Brewfile ~/Brewfile
ln -sf $PWD/.ctags ~/.ctags
# emacs
ln -sf $PWD/.emacs.d ~/.emacs.d
ln -sf $PWD/.spacemacs ~/.spacemacs
# eslint
ln -sf $PWD/.eslintrc.json ~/.eslintrc.json
# Brewfile
ln -sf $PWD/.brewfile ~/.brewfile
# tmux
ln -sf $PWD/.tmux.conf ~/.tmux.conf
