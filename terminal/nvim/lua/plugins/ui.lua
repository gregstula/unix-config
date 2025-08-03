local M = {}

function M.setup()
	return {
		{ "nvim-tree/nvim-tree.lua", opts = require("plugins.settings.nvim-tree").opts },
		{ "lewis6991/gitsigns.nvim", opts = {} },
		{
			"ibhagwan/fzf-lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {},
		},
		{ "nvchad/volt" },
		{ "nvzone/menu" },

		-- Using nvchad's amazing UI without rolling the whole distro
		-- https://nvchad.com/news/nvui
		{
			"nvchad/ui",
			config = function()
				require("nvchad")
			end,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
			},
		},
		"nvchad/base46",
		-- Colorscheme tool, ironically the former name of my colorscheme ..lol
		{ "nvzone/minty", cmd = { "Huefy", "Shades" } },
	}
end

function M.configure()
	-- Enable colorscheme
	-- NOTE: Cyberia Mint is my own personal colorscheme that I've wrangled together over the years since 2020
	-- vim.cmd("colorscheme cyberia_mint")
	-- I have also ported Cyberia Mint to base46 to use with nvchad UI
	require("nvconfig").base46.theme = "cyberia_mint"
	require("base46").load_all_highlights()

	-- base46 load method 2, for non lazyloaders) to load all highlights at once
	-- See h: nvui for more info
	for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
		dofile(vim.g.base46_cache .. v)
	end
end

return M
