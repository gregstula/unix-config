local M = {}
function M.setup()
return {
		-- Parser packagemanager for treesitter
		"nvim-treesitter/nvim-treesitter", -- TS parser package manager
		lazy = false,
		branch = "main", -- active development branch
		build = ":TSUpdate",
}
end

return M
