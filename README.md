# UNIX-config

A collection of dotfiles and scripts to bootstrap my zsh and vim environments

#### Minimun Requirements:
`pacman -S zsh git vim luajit curl tree-sitter tree-sitter-cli`

#### Basic Install 
`./setup_environment.zsh`

## VIM
`:PlugInstall`

Should automatically setup YCM with LSPs unless missing python or cmake
Vim is less maintained for now as I try to use NeoVim more but I will backport 
anything like keybinds etc

## NVIM
Lazy will install itself on first use and NeoVim should just werk
*You need to run checkhealth if something isn't working, you need to install tree-sitter tree-sitter-cli, etc*


## Cyberia Mint - Color Scheme
`cyberia_mint` is the name of my colorscheme
It is available for Konsole, Vim, and Neovim

<img width="2147" height="1932" alt="image" src="https://github.com/user-attachments/assets/05dc39f3-3257-4cd5-9543-df842cf66139" />
