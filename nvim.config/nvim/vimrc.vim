filetype off
syntax on
filetype plugin indent on
set sessionoptions-=options

" vim not vi
set nocompatible

filetype plugin indent on    " required

syntax on
set number

" Auto indent
set ai
" Smart indent
set si

" Treats tabs like buffers ... questionable
tab sball

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" This shows what you are typing as a command.
set showcmd

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Visualize tabs
"syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue


" globally use spaces instead of tabs
set expandtab

set ts=4
set sw=4

" Be smart when using tabs ;)
set smarttab

" default character width 100
set tw=120
set colorcolumn=120
set cursorline
set ruler

" Autotrim trailing whitespace on exit
autocmd BufWritePre * %s/\s\+$//e
set wrap
set linebreak
set showbreak=>\ \ \

" Hide the mouse pointer while typing
set mousehide

" Make the command-line completion better
set wildmenu

" Zee greatest shell
set shell=zsh


" TODO: the remaining language specific stuff should all be in submodules of plugin forks
autocmd FileType c setlocal tw=80 colorcolumn=80 expandtab

" makefiles need tabs
autocmd FileType make setlocal noexpandtab

" Obj-C++
autocmd BufRead,BufNewFile *.mm,*.mpp setlocal cindent filetype=objc++ expandtab

" Ruby
autocmd FileType ruby setlocal  tabstop=2 sw=2 expandtab
autocmd FileType eruby setlocal tabstop=2 sw=2 expandtab

autocmd FileType python setlocal tabstop=4 sw=4 expandtab

" JS and JSON
autocmd FileType javascript setlocal tabstop=4 sw=4 expandtab
autocmd FileType json setlocal tabstop=4 sw=4 expandtab
autocmd BufRead,BufNewFile .eslintrc,.babelrc setlocal filetype=json

" shell
autocmd BufRead,BufNewFile *.sh,*.zsh,*.bash setlocal expandtab ts=4 sw=4

"HTML
autocmd FileType html setlocal tabstop=4 sw=4 expandtab

" C++
autocmd FileType c++ :CCToggle setlocal ts=4 sw=4 expandtab
autocmd BufRead,BufNewFile *.hpp,*.hh set ft=cpp
autocmd BufRead,BufNewFile .clang-format set ft=yaml

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"parens matching is white to see easily
highlight MatchParen ctermfg = 0xffffff

set encoding=utf-8
