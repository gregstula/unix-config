local M = {}

function M.setup()
	return {
		{ "nvim-tree/nvim-tree.lua", opts = {} },
		-- Using nvchad's amazing UI without rolling the whole distro
		-- https://nvchad.com/news/nvui
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons", lazy = true },

		{
			"nvchad/ui",
			config = function()
				require("nvchad")
			end,
		},

		{
			"nvchad/base46",
			lazy = true,
			build = function()
				require("base46").load_all_highlights()
			end,
		},

		"nvchad/volt", -- optional, needed for theme switcher
		-- or just use Telescope themes
	}
end

-- one or the other
function M.setup_other_ui()
	return {
		-- Lualine, a status line like airline but for neovim
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
		opts = {},
		config = function(_, opts)
			require("lualine").setup(opts)
			require("nvim-web-devicons").setup()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	}
end

return M
