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
		-- Adds a very cool pop up window with LSP start up information
		-- Gives immediete feedback on file open that LSP is enabled and running on the file
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		-- Auto format on save
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
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
		-- Automatically vim.lsp.enable() on the appropriate config file from neovim-lsp on lsps installed with Mason
		-- Install lsp with Mason -> automatically enables -> config can still be extended here
		-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
})

-- LSP Configureation + Native completion
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- Extra settings can be specified for each LSP server.
-- With Nvim 0.11+ you can extend a config by calling vim.lsp.config('…', {…}).
-- (You can also copy any config directly from lsp/ and put it in a local lsp/ directory in your 'runtimepath').

-- Lua Language Server Neovim Configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
-- If you primarily use `lua-language-server` for Neovim, and want to provide completions,
-- analysis, and location handling for plugins on runtime path, you can use the following
-- settings.
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					vim.fn.stdpath("data") .. "/lazy",
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				},
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	virtual_text = { current_line = true },
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
