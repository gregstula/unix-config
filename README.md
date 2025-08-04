# UNIX-config

A collection of dotfiles and scripts to bootstrap my zsh and vim environments

#### Minimun Requirements:
`pacman -S zsh git vim`

#### Basic Install 
`./setup_environment.zsh`

## VIM
`:PlugInstall`

Should automatically setup YCM with LSPs unless missing python or cmake
Vim is less maintained for now as I try to use NeoVim more but I will backport 
anything like keybinds etc

## NVIM
Lazy will install itself on first use and NeoVim should just werk

## ColorScheme
`cyberia_mint` is the name of my colorscheme
It is available for Konsole, Vim, and Neovim
<img width="2149" height="1981" alt="image" src="https://github.com/user-attachments/assets/c76f2a64-bdb2-4127-a1be-3f52257d8e2e" />


`// TODO:` I would like to share code with vim and neovim in a way that doesn't fuck with my installation symlinks
