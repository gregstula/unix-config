-- vimrc always overrides on session reload
-- NOTE: Document why you ever enabled this before enabling again
-- vim.opt.sessionoptions:remove("options")
-----------

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

--  If you search for something containing uppercase characters, it will do a case sensitive search;
--  if you search for something purely lowercase, it will do a case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- KEYMAPS --
-- NOTE: a map leader makes it possible to do extra key combinations
-- Default leader is \ which is what I use
-- A lot of neovim users use space or comma as the leader
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = " "
-- Pressing \ss will toggle and untoggle spell checking
vim.keymap.set("n", "<Leader>ss", ":setlocal spell!<CR>")

-- \/ resets search highlighting
vim.keymap.set("n", "<Leader>/", ":noh<CR>")

-- NOTE: This remap allows you to move highlighted text from visual with up(k) and down(j)
-- https://youtu.be/w7i4amO_zaE?si=UiyaDMFy7e5VJnoP&t=1534
-- v = visual, J = Shift J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Create a new line before put with Shift-\P or after with \p keep cursor position
vim.keymap.set("n", "<Leader>p", "mz:put<CR>`z")
vim.keymap.set("n", "<Leader>P", "mz:put!<CR>`z")

-- Inset a new line below with \o or new line above with \O while staying in normal mode
-- without switching cursor positions
vim.keymap.set("n", "<Leader>o", "mz:put _<CR>`z")
vim.keymap.set("n", "<Leader>O", "mz:put! _<CR>`z")

-- \d Jump to the next diagnostic and show floating window
vim.keymap.set("n", "<Leader>d", "]d <C-W>d", { remap = true })
-- \e Show diagnostic floating window under the cursor
vim.keymap.set("n", "<Leader>w", "<C-W>d", { remap = true })

-- Shift J appends the line under the cursor to the line where the cursor is
-- This keymap makes the cursor stay in place so you can chain it
-- vim.keymap.set("n", "J", "mzJ`z")

-- Yank to wayland keyboard
vim.opt.clipboard = "unnamedplus"

-- Plugin Manager
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

--- ENABLED PLUGINS AND CONFIG SETTINGS
-- NOTE: Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Setup lazy.nvim
require("lazy").setup({
	{
		-- Parser packagemanager for treesitter
		"nvim-treesitter/nvim-treesitter", -- TS parser package manager
		lazy = false,
		branch = "main", -- active development branch
		build = ":TSUpdate",
	},
	{
		-- Lualine, a status line like airline but for neovim
		"nvim-lualine/lualine.nvim",
		dependencies = {
			-- Nerdfont icons
			"echasnovski/mini.icons",
		},
		config = function(_, opts)
			require("lualine").setup({ opts })
			-- Setup mini icons with web_devicons api
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				zsh = { "shfmt" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				go = { "gofmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",

		opts = {
			-- 'default' (recommended)
			-- for mappings similar to built-in completions (C-y to accept)
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
			keymap = { preset = "default" },

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
				-- add lazydev to your completion providers
				default = { "lazydev", "lsp", "path", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance
			-- and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"`
			-- or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available,
			-- by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		-- Automatically enables the appropriate config file from the repo
		-- When an LSP is installed with mason
		-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {},
	},
})

-- lSP config
-- Extra settings can be specified for each LSP server.
-- With Nvim 0.11+ you can extend a config by calling vim.lsp.config('…', {…}).
-- (You can also copy any config directly from lsp/
-- and put it in a local lsp/ directory in your 'runtimepath').
vim.lsp.config("bashls", {
	filetypes = { "bash", "sh", "zsh" },
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	signs = { severity = { vim.diagnostic.severity.ERROR } },
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
vim.cmd("colorscheme minty")
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
