# UNIX-config

A collection of dotfiles and scripts to bootstrap my unix environments

#### Minimun Requirements:
`pacman -S zsh git vim luajit curl tree-sitter tree-sitter-cli`

#### Basic Install 
`./setup_environment.zsh`


## Cyberia Mint - Color Scheme
`cyberia_mint` is the name of my colorscheme
It is available for Konsole, Vim, and Neovim

<img width="2147" height="1932" alt="image" src="https://github.com/user-attachments/assets/05dc39f3-3257-4cd5-9543-df842cf66139" />

## VIM Setup
`:PlugInstall`

Should automatically setup YCM with LSPs unless missing python or cmake
Vim is less maintained for now as I try to use NeoVim more but I will backport 
anything like keybinds etc

## NVIM Setup
Lazy will install itself on first use and NeoVim should just werk
*You need to run checkhealth if something isn't working, you need to install tree-sitter tree-sitter-cli, etc*


