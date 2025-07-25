-- vimrc always overrides on session reload
vim.opt.sessionoptions:remove("options")

-- in regular vim this messes with mouse copying but not in nvim :)
vim.opt.number = true

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
--vim.opt.colorcolumn = "120"
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
-- vim.cmd('color minty')

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
-- Setup lazy.nvim
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter", -- TS parser package manager
		lazy = false,
		branch = "main", -- active development branch
		build = ":TSUpdate",
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly:
        -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "super-tab" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"`
            -- or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
})

-- TREE SITTER
-- Using native implementation as much as possible and
-- only using main of nvim-treesitter as parser manager
-- This is the direction devs are going anyways
-- with nvim-treesitter being a testbad for upstream native support
-- install needed to config
-- Nvim includes these parsers:
-- https://neovim.io/doc/user/treesitter.html#treesitter-parsers
-- C Lua Markdown Vimscript Vimdoc
-- Use T:SInstall all for the rest
require("nvim-treesitter").install({ "bash" })
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
		callback = function()
			vim.treesitter.start()
		end,
	})
end

-- Enable colorscheme with transparency
-- Minty is my own personal colorscheme that has been wrangled together over the years since 2020
-- Minty is pitch black so transparency meshes with 10% terminal transparency in Konsole settings
-- when Konsole also set to the Minty profile and colorscheme
vim.cmd("colorscheme minty")
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
