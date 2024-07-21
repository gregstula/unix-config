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

let g:jsx_ext_required = 0
let g:js_context_colors_jsx=1
let g:syntastic_javascript_checkers = ['eslint']
let g:synstastic_json_checkers = ['jsonlint']
let g:vim_json_syntax_conceal = 0

if executable('node_modules/.bin/eslint')
  let b:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
endif

"HTML
autocmd FileType html setlocal tabstop=4 sw=4 expandtab

" C++
autocmd FileType c++ :CCToggle setlocal ts=4 sw=4 expandtab
autocmd BufRead,BufNewFile *.hpp,*.hh set ft=cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1

autocmd BufRead,BufNewFile .clang-format set ft=yaml

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"parens matching is white to see easily
highlight MatchParen ctermfg = 0xffffff

" HTML AUTO CLOSE TAG SETTINGS
" - - - - - - - - - - - - - -
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

set encoding=utf-8
