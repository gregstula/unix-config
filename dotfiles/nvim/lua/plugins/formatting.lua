local M = {}
function M.setup()
return {
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
}
end
return M
