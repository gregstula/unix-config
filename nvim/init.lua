-- vimrc always overrides on session reload
vim.opt.sessionoptions:remove("options")

-- vim not vi
vim.opt.compatible = false

vim.cmd('filetype plugin indent on')

vim.cmd('syntax on')
-- vim.opt.number = true

-- Auto indent
vim.opt.ai = true
-- Smart indent
vim.opt.si = true

-- Treats tabs like buffers ... questionable
vim.cmd('tab sball')

-- Allow backspacing over autoindent, line breaks and start of insert action
vim.opt.backspace = "indent,eol,start"

-- This shows what you are typing as a command.
vim.opt.showcmd = true

-- Visualize tabs
-- vim.cmd('syntax match Tab /\\t/')
vim.cmd('hi Tab gui=underline guifg=blue ctermbg=blue')

-- globally use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sw = 4

-- Be smart when using tabs ;)
vim.opt.smarttab = true

-- default character width 100
vim.opt.tw = 120
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true
vim.opt.ruler = true

-- Autotrim trailing whitespace on exit
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e"
})
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "> \\ \\ "

-- Hide the mouse pointer while typing
vim.opt.mousehide = true

-- Make the command-line completion better
vim.opt.wildmenu = true

-- Zee greatest shell
vim.opt.shell = "zsh"

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ",,"
vim.g.maplocalleader = ",,"
-- Pressing ,ss will toggle and untoggle spell checking
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<cr>')

-- Yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- the one and only colorscheme I ever use
-- vim.cmd('color molokai')
-- Actually I use this one now (I made it myself)
-- vim.cmd('color stula')
vim.g.airline_theme = 'base16_monokai'

-- Transparent
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- Unicode
vim.opt.encoding = "utf-8"

-- For the meme
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

