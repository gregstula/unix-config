local M = {}
function M.setup()
	return {
		-- Let's lua LSP understand neovim config files and plugins in a fast and performant way
		-- NOTE: Do not try to solve this yourself just use the plugin... so much pain
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{
			-- Adds a very cool pop up window with LSP start up information
			-- Gives immediete feedback on file open that LSP is enabled and running on the file
			"j-hui/fidget.nvim",
			opts = {},
		},
		{
			-- Automatically vim.lsp.enable() on the appropriate config
			-- file from neovim-lsp on lsps installed with Mason
			-- Install lsp with Mason -> automatically enables -> config can still be extended here
			-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
			"mason-org/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
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
		{ -- linters for where they still make more sense than lsps
			"mfussenegger/nvim-lint",
			config = function()
				require("lint").linters_by_ft = {
					systemd = { "systemd-analyze" },
					vim.cmd("au BufWritePost * lua require('lint').try_lint()"),
				}
			end,
		},
	}
end

function M.configure()
	-- linters setup here

	require("lint").linters_by_ft = { systemd = { "systemd-analyze" } }
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			-- try_lint without arguments runs the linters defined in `linters_by_ft`
			-- for the current filetype
			require("lint").try_lint()
		end,
	})

	-- Remove Semantic highlighting from LSP to use only treesitter
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and client.server_capabilities and client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end,
	})
end

return M
