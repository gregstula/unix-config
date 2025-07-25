-- vimrc always overrides on session reload
vim.opt.sessionoptions:remove("options")

-- vim.opt.number = true

-- Treats tabs like buffers ... questionable
vim.cmd("tab sball")

-- Visualize tabs
-- vim.cmd('syntax match Tab /\\t/')
vim.cmd("hi Tab gui=underline guifg=blue ctermbg=blue")

-- globally use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sw = 4

-- default character width 100
vim.opt.tw = 120
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true

-- Autotrim trailing whitespace on exit
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "> \\ \\ "

-- Hide the mouse pointer while typing
vim.opt.mousehide = true

-- Zee greatest shell
vim.opt.shell = "zsh"

-- KEYMAPS --
-- For the meme
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
-- Default leader is \ which is what I use

-- A lot of neovim users use space or comma as the leader
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = " "

-- Pressing \ss will toggle and untoggle spell checking
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<cr>")

-- Yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- the one and only colorscheme I ever use
-- vim.cmd('color molokai')
-- Actually I use this one now (I made it myself)
-- vim.cmd('color stula')

-- Transparent
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

-- Plugins
-- TODO: Replace this with the native built-in neovim package manager that was released July 2025
-- Eventually we want a guanteed to be here and working plugin config
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
	},
})
