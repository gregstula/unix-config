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
	}
end

return M
