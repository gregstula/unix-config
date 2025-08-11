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

function M.configure()
	-- TREE SITTER
	-- NOTE: Using native implementation as much as possible and
	-- only using main of nvim-treesitter as parser manager
	-- This is the direction devs are going anyways
	-- with nvim-treesitter being a testbad for upstream native support
	-- install needed to config
	-- Nvim includes these parsers:
	-- https://neovim.io/doc/user/treesitter.html#treesitter-parsers
    -- require('nvim-treesitter').install({ 'all' }):wait(300000)
	-- Built in tree-sitter settings
	vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	-- zsh doesn't have it's own parser yet
	vim.treesitter.language.register("bash", { "zsh", "sh" })
	-- Enable built-in tree-sitter highlighting for all filetypes
	-- https://neovim.io/doc/user/treesitter.html#vim.treesitter.start()
	local filetypes = vim.fn.getcompletion("", "filetype")
	for _, ft in ipairs(filetypes) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ft,
			callback = function(args)
				local success, _ = pcall(vim.treesitter.start, args.buf, vim.treesitter.language.get_lang(ft))
				if not success then
					vim.bo[args.buf].syntax = "ON"
				end
			end,
		})
	end
end

return M
