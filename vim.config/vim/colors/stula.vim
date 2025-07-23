" Header
"  Please edit this text.

let s:colors_name='stula'
set background=dark

if !has('gui_running') && &t_Co<256
  echomsg 'Error: colorscheme "'.s:colors_name.'" requires 256 colors.'
  echomsg 'You may solve the problem with the following command.'
  echomsg ':set t_Co=256 | colorscheme '.s:colors_name
  finish
endif

highlight clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name=s:colors_name

hi      Normal       guifg=#F8F8F2 guibg=#1B1D1E ctermfg=252  ctermbg=232 gui=NONE cterm=NONE
hi      Comment      guifg=#808080 guibg=NONE    ctermfg=244  ctermbg=NONE gui=NONE cterm=NONE
hi      Constant     guifg=#a97ba7 guibg=NONE    ctermfg=13   ctermbg=NONE gui=bold cterm=bold
hi      String       guifg=#5de3e0 guibg=NONE    ctermfg=14   ctermbg=NONE gui=NONE cterm=NONE
hi link Character    String
hi      Number       guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi      Boolean      guifg=#a97ba7 guibg=NONE    ctermfg=13   ctermbg=NONE gui=bold cterm=bold
hi link Float        Number
hi      Identifier   guifg=#7b9ccd guibg=NONE    ctermfg=12   ctermbg=NONE gui=italic cterm=italic
hi      Function     guifg=#5de3e0 guibg=NONE    ctermfg=14   ctermbg=NONE gui=bold cterm=bold
hi      Statement    guifg=#d7005f guibg=NONE    ctermfg=161  ctermbg=NONE gui=bold cterm=bold
hi link Conditional  Statement
hi link Operator     Function
hi link Exception    Statement
hi      PreProc      guifg=#5fd7ff guibg=NONE    ctermfg=81   ctermbg=NONE gui=NONE cterm=NONE
hi      Type         guifg=#5fd7ff guibg=NONE    ctermfg=81   ctermbg=NONE gui=NONE cterm=NONE
hi link StorageClass Identifier
hi      Special      guifg=#5fd7ff guibg=NONE    ctermfg=81   ctermbg=NONE gui=NONE cterm=NONE
hi      Underlined   guifg=#5fd7ff guibg=NONE    ctermfg=81   ctermbg=NONE gui=underline cterm=underline
hi      Ignore       guifg=#808080 guibg=NONE    ctermfg=244  ctermbg=NONE gui=NONE cterm=NONE
hi      Error        guifg=#edeeeb guibg=#e41339 ctermfg=15   ctermbg=9    gui=NONE cterm=NONE
hi      Todo         guifg=#000000 guibg=#f6eb53 ctermfg=0    ctermbg=11   gui=NONE cterm=NONE
hi      ColorColumn  guifg=NONE    guibg=#cc0000 ctermfg=NONE ctermbg=1    gui=NONE cterm=NONE
hi      DiffAdd      guifg=NONE    guibg=#3f3876 ctermfg=NONE ctermbg=4    gui=NONE cterm=NONE
hi      DiffChange   guifg=NONE    guibg=#734e7a ctermfg=NONE ctermbg=5    gui=NONE cterm=NONE
hi      DiffDelete   guifg=#d70087 guibg=#5f005f ctermfg=162  ctermbg=53   gui=bold cterm=bold
hi      DiffText     guifg=NONE    guibg=#878787 ctermfg=NONE ctermbg=102  gui=bold cterm=bold
hi      ErrorMsg     guifg=#edeeeb guibg=#cc0000 ctermfg=15   ctermbg=1    gui=NONE cterm=NONE
hi      Folded       guifg=#5de3e0 guibg=#6c6c6c ctermfg=14   ctermbg=242  gui=NONE cterm=NONE
hi      FoldColumn   guifg=#5de3e0 guibg=#6c6c6c ctermfg=14   ctermbg=242  gui=NONE cterm=NONE
hi      IncSearch    guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi      LineNr       guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi      ModeMsg      guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=bold cterm=bold
hi      MoreMsg      guifg=#87ffaf guibg=NONE    ctermfg=121  ctermbg=NONE gui=bold cterm=bold
hi      NonText      guifg=#7b9ccd guibg=NONE    ctermfg=12   ctermbg=NONE gui=bold cterm=bold
hi      Pmenu        guifg=#5fd7ff guibg=#000000 ctermfg=81   ctermbg=16   gui=NONE cterm=NONE
hi      PmenuSel     guifg=#6c6c6c guibg=#000000 ctermfg=242  ctermbg=0    gui=NONE cterm=NONE
hi      PmenuSbar    guifg=NONE    guibg=#a8a8a8 ctermfg=NONE ctermbg=248  gui=NONE cterm=NONE
hi      PmenuThumb   guifg=#5fd7ff guibg=#8787af ctermfg=81   ctermbg=103  gui=bold cterm=bold
hi      Search       guifg=#000000 guibg=#f6eb53 ctermfg=0    ctermbg=11   gui=NONE cterm=NONE
hi      SpellBad     guifg=NONE    guibg=#e41339 ctermfg=NONE ctermbg=9    gui=undercurl cterm=NONE
hi      SpellCap     guifg=NONE    guibg=#7b9ccd ctermfg=NONE ctermbg=12   gui=undercurl cterm=NONE
hi      SpellLocal   guifg=NONE    guibg=#5de3e0 ctermfg=NONE ctermbg=14   gui=undercurl cterm=NONE
hi      SpellRare    guifg=NONE    guibg=#a97ba7 ctermfg=NONE ctermbg=13   gui=undercurl cterm=NONE
hi      StatusLine   guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi      StatusLineNC guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi      TabLine      guifg=#edeeeb guibg=#6c6c6c ctermfg=15   ctermbg=242  gui=underline cterm=underline
hi      TabLineFill  guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi      TabLineSel   guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=bold cterm=bold
hi      Title        guifg=#ffd7ff guibg=NONE    ctermfg=225  ctermbg=NONE gui=bold cterm=bold
hi      Visual       guifg=#000000 guibg=#a8a8a8 ctermfg=0    ctermbg=248  gui=NONE cterm=NONE
hi      VisualNOS    guifg=NONE    guibg=NONE    ctermfg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi      WarningMsg   guifg=#ffffff guibg=#444444 ctermfg=231  ctermbg=238  gui=bold cterm=bold
hi      WildMenu     guifg=#ffffff guibg=#444444 ctermfg=231  ctermbg=238  gui=bold cterm=bold
hi      CursorColumn guifg=NONE    guibg=#303030 ctermfg=NONE ctermbg=236  gui=NONE cterm=NONE
hi      CursorLine   guifg=NONE    guibg=#585858 ctermfg=NONE ctermbg=240  gui=underline cterm=underline
hi      CursorLineNr guifg=#ff8700 guibg=NONE    ctermfg=208  ctermbg=NONE gui=NONE cterm=NONE
hi      MatchParen   guifg=NONE    guibg=#379897 ctermfg=NONE ctermbg=6    gui=NONE cterm=NONE
hi      SignColumn   guifg=#5de3e0 guibg=#6c6c6c ctermfg=14   ctermbg=242  gui=NONE cterm=NONE
hi      SpecialKey   guifg=#5fd7ff guibg=NONE    ctermfg=81   ctermbg=NONE gui=italic cterm=italic
hi      VertSplit    guifg=NONE    guibg=#080808 ctermfg=NONE ctermbg=232  gui=bold cterm=bold

" Created with vim-colorscheme-edit v1.0.0
"   https://github.com/nokobear/vim-colorscheme-edit
set background=dark
