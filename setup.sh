#!/bin/bash

mkdir ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.cache/dein
rm dein_installer.sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.vimperatorrc ~/.vimperatorrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.eskk ~/.eskk
ln -sf ~/dotfiles/.skk_dictionary ~/.skk_dictionary
ln -sf ~/dotfiles/.tmux.d ~/.tmux.d
ln -sf ~/dotfiles/.source-highlight ~/.source-highlight
ln -sf ~/dotfiles/.show-256-colors.py ~/.show-256-colors.py
ln -sf ~/dotfiles/nvim ~/.config/nvim
