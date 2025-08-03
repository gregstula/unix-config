local M = {}
function M.setup()
	-- KEYMAPS --
	-- NOTE: a map leader makes it possible to do extra key combinations
	-- Default leader is \ which is what I use
	-- A lot of neovim users use space or comma as the leader
	-- vim.g.mapleader = ","
	-- vim.g.maplocalleader = " "
	-- Pressing \ss will toggle and untoggle spell checking
	vim.keymap.set("n", "<Leader>ss", ":setlocal spell!<CR>", { desc = "Spell check" })

	-- \escape resets search highlighting
	vim.keymap.set("n", "<Leader><esc>", ":noh<CR>", { desc = "Escape highlighting after search" })

	-- NOTE: This remap allows you to move highlighted text from visual with up(k) and down(j)
	-- https://youtu.be/w7i4amO_zaE?si=UiyaDMFy7e5VJnoP&t=1534
	-- v = visual, J = Shift J
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text" })
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text" })

	-- Create a new line before put with Shift-\P or after with \p keep cursor position
	vim.keymap.set("n", "<Leader>p", "mz:put<CR>`z", { desc = "Put yanked text below cursor without jump" })
	vim.keymap.set("n", "<Leader>P", "mz:put!<CR>`z", { desc = "Put yanked text above cursor without jump" })

	-- Inset a new line below with \o or new line above with \O while staying in normal mode
	-- without switching cursor positions
	vim.keymap.set("n", "<Leader>o", "mz:put _<CR>`z", {
		desc = "Insert new line below without entering insert mode",
	})
	vim.keymap.set("n", "<Leader>O", "mz:put! _<CR>`z", {
		desc = "insert new line above without entering insert mode",
	})

	-- \d Jump to the next diagnostic and show floating window
	vim.keymap.set("n", "<Leader>d", "]d <C-W>d", { remap = true, desc = "local map = vim.keymap.set" })

	-- Shift J appends the line under the cursor to the line where the cursor is
	-- This keymap makes the cursor stay in place so you can chain it
	-- vim.keymap.set("n", "J", "mzJ`z")

	-- nvchad Key Maps
	-- nvimtree
	vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
	vim.keymap.set("n", "<leader>th", function()
		require("nvchad.themes").open()
	end, { desc = "telescope nvchad themes" })
end
return M
