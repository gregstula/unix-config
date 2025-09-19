vim.opt.number = true
-- globally use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sw = 4
-- default character width 100
vim.opt.tw = 100
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
-- Visualize tabs when file is not using spaces
vim.cmd "hi Tab gui=underline guifg=blue ctermbg=blue"

-- trim trailing whitespece (confirmed, do not remove, not all formatters work like zsh)
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Disable all mouse
vim.cmd [[
    set mouse=nv
]]

-- Line break settings
-- Box drawing character  on line break
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "└ "

-- Replace end-of-buffer tildes (~) with spaces for cleaner look
vim.opt.fillchars = { eob = " " }

-- Keep one status across all splits (including file tree etc)
vim.opt.laststatus = 3

-- Don't show --- INSERT -- in command line since we have a status line for that
vim.opt.showmode = false

-- keep cursor position relative to screen when splitting
vim.opt.splitkeep = "screen"

-- Hide the mouse pointer while typing
vim.opt.mousehide = true

-- Zee greatest shell
vim.opt.shell = "zsh"
-- Minimum width of line number column
vim.o.numberwidth = 2

-- Don't show cursor position in bottom right
vim.opt.ruler = true

-- Always show sign column to prevent text shifting
vim.opt.signcolumn = "yes"

-- New horizontal splits open below current window
vim.opt.splitbelow = true

-- New vertical splits open to the right of current window
vim.o.splitright = true

-- Enable persistent undo across sessions
vim.opt.undofile = true

--  If you search for something containing uppercase characters, it will do a case sensitive search;
--  if you search for something purely lowercase, it will do a case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Yank to wayland keyboard
vim.opt.clipboard = "unnamedplus"

-- Lua Onlyism
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Faster completion and git signs update
vim.opt.updatetime = 250 -- (milliseconds)

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
    severity_sort = true,
    underline = true,
    --virtual_lines = { current_line = true },
    virtual_text = { current_line = true },
    float = true,
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰛩",
        },
    },
}

-- Set listchars to use dots for spaces and tabs
-- Use set list! to disable
vim.opt.list = true
vim.opt.listchars = {
    lead = "·",
    tab = "→ ", -- Arrows for tabs
    trail = "·", -- Dots for trailing spaces
}

-- Plugin Manager aka Lazy
-- NOTE: Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim plugin manager so that mappings are correct.
require("keymaps").setup() -- my keymaps

-- This is also a good place to setup other settings (vim.opt)
-- Ensure base46 path is set before plugin setup since they apply to plugins
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

--- ENABLED PLUGINS AND CONFIG SETTINGS
local Plugins = require "plugins"
Plugins.bootstrap()
-- Setup lazy.nvim
Plugins.setup()
