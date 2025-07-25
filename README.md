# UNIX-config

A collection of dotfiles and scripts to bootstrap my zsh and vim environments

Requires: `zsh git vim`
Install `./setup_environment.zsh`

## VIM
`:PlugInstall`

Should automatically setup YCM with LSPs unless missing python or cmake
Vim is less maintained for now as I try to use NeoVim more but I will backport 
anything like keybinds etc

## NVIM
Lazy will install itself on first use and NeoVim should just werk

`:TSInstall all` 
to install the rest of the parsers


## ColorScheme
Minty is the name of my colorscheme
It is available for Konsole, Vim, and Neovim

`// TODO:` I would like to share code with vim and neovim in a way that doesn't fuck with my installation symlinks
