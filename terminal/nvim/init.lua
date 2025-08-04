vim.opt.number = true
-- globally use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sw = 4
-- default character width 100
vim.opt.tw = 120
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true
-- Visualize tabs when file is not using spaces
vim.cmd("hi Tab gui=underline guifg=blue ctermbg=blue")

-- Line break settings
-- Box drawing character  on line break
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "└ "

-- Replace end-of-buffer tildes (~) with spaces for cleaner look
vim.opt.fillchars = { eob = " " }

-- Keep one status across all splits (including file tree etc)
vim.o.laststatus = 3

-- Don't show --- INSERT -- in command line since we have a status line for that
vim.o.showmode = false

-- keep cursor position relative to screen when splitting
vim.o.splitkeep = "screen"

-- Hide the mouse pointer while typing
vim.opt.mousehide = true

-- Zee greatest shell
vim.opt.shell = "zsh"

--  If you search for something containing uppercase characters, it will do a case sensitive search;
--  if you search for something purely lowercase, it will do a case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Yank to wayland keyboard
vim.opt.clipboard = "unnamedplus"

-- Plugin Manager aka Lazy
-- NOTE: Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim plugin manager so that mappings are correct.
require("keymaps").setup() -- my keymaps

-- This is also a good place to setup other settings (vim.opt)
-- Ensure base46 path is set before plugin setup since they apply to plugins
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

--- ENABLED PLUGINS AND CONFIG SETTINGS
local Plugins = require("plugins")
Plugins.bootstrap()
-- Setup lazy.nvim
Plugins.setup()
