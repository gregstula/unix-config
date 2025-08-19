local M = {}
M.opts = {
	disable_netrw = true, -- Completely disable netrw
	hijack_cursor = true, -- Keeps the cursor on the first letter of the filename when moving in the tree.
	hijack_unnamed_buffer_when_opening = false, -- Opens in place of the unnamed buffer if it's empty.
	sync_root_with_cwd = false, -- Changes the tree root directory on `DirChanged` and refreshes the tree.
	respect_buf_cwd = false, -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
	view = {
		preserve_window_proportions = true, -- Preserves window proportions when opening a file.
	},
	git = {
		ignore = false,
	},
	renderer = {
		add_trailing = true, -- Appends a trailing slash to folder names.
		icons = {
			glyphs = {
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "󰦍",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	-- Update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file.
	update_focused_file = {
		enable = false,
		update_root = {
			-- Update the root directory of the tree if the file is not under current
			-- root directory. It prefers vim's cwd and `root_dirs`.
			-- Otherwise it falls back to the folder containing the file.
			-- Only relevant when `update_focused_file.enable` is `true`
			enable = false,
		},
	},
	-- Prefer startup root directory when updating root directory of the tree.
	-- Only relevant when `update_focused_file.update_root` is `true`
	prefer_startup_root = false,
}

function M.set_globals()
	-- eagerly disable netrw to prevent race conditions on vim startup
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

return M
