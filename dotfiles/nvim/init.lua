-- vimrc always overrides on session reload
-- NOTE: Document why you ever enabled this before enabling again
-- vim.opt.sessionoptions:remove("options")

-- in regular vim line numbers messes with mouse copying but not in nvim :)
vim.opt.number = true
-- Treats tabs like buffers ... questionable
-- NOTE: Document why this was here before enabling it again
--vim.cmd("tab sball")
-- Visualize tabs
-- vim.cmd('syntax match Tab /\\t/')
vim.cmd("hi Tab gui=underline guifg=blue ctermbg=blue")
-- globally use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.sw = 4
-- default character width 100
vim.opt.tw = 120
--vim.opt.colorcolumn = "120"
vim.opt.cursorline = true

-- Autotrim trailing whitespace on exit
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	command = "%s/\\s\\+$//e",
-- })
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "└ " -- Box drawing character  on line break
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

-- My Keymaps
require("keymaps").setup()

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/" -- Set up base46 theme plugin before Lazy

-- Plugin Manager
-- TODO: Replace this with the native built-in neovim package manager that was released July 2025
-- Eventually we want a guanteed to be here and working plugin config
-- Bootstrap lazy.nvim
local Plugins = require("plugins")
Plugins.bootstrap()

--- ENABLED PLUGINS AND CONFIG SETTINGS
-- NOTE: Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Setup lazy.nvim

Plugins.setup()

-- (method 2, for non lazyloaders) to load all highlights at once
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	virtual_text = { current_line = true },
	update_in_insert = false,
	signs = {
		severity = { vim.diagnostic.severity.ERROR },
	},
})

-- TREE SITTER
-- NOTE: Using native implementation as much as possible and
-- only using main of nvim-treesitter as parser manager
-- This is the direction devs are going anyways
-- with nvim-treesitter being a testbad for upstream native support
-- install needed to config
-- Nvim includes these parsers:
-- https://neovim.io/doc/user/treesitter.html#treesitter-parsers
require("nvim-treesitter").install({ "all" })
-- Built in tree-sitter settings
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- zsh doesn't have it's own parser yet
vim.treesitter.language.register("bash", { "zsh" })
-- Enable built-in tree-sitter highlighting for all filetypes
-- https://neovim.io/doc/user/treesitter.html#vim.treesitter.start()
local filetypes = vim.fn.getcompletion("", "filetype")
for _, ft in ipairs(filetypes) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		callback = function(args)
			local success, _ = pcall(vim.treesitter.start, args.buf, ft)
			if not success then
				vim.bo[args.buf].syntax = "ON"
			end
		end,
	})
end

-- Enable colorscheme with transparency
-- NOTE: Minty is my own personal colorscheme that I've wrangled together over the years since 2020
-- Minty is pitch black so transparency meshes with 10% terminal transparency in Konsole settings
-- when Konsole also set to the Minty profile and colorscheme
-- vim.cmd("colorscheme minty")
-- vim.cmd([[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
-- ]])
