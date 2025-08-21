local M = {}
function M.setup()
    -- KEYMAPS --
    -- A map leader makes it possible to do extra key combinations
    -- A lot of neovim users use space or comma as the leader
    -- Remember, that a future switch to <Space> requires additional map top nop
    -- vim.cmd [[ nnoremap <Space> <nop> ]]
    -- vim.g.mapleader = " "
    -- vim.g.maplocalleader = " "

    -- NOTE: Default map leader is \ which is what I use

    -- Pressing \ss will toggle and untoggle spell checking
    vim.keymap.set("n", "<Leader>ss", ":setlocal spell!<CR>", { desc = "Spell check" })

    -- \escape resets search highlighting
    vim.keymap.set("n", "<Leader><esc>", ":noh<CR>", { desc = "Escape highlighting after search" })

    -- NOTE: This remap allows you to move highlighted text from visual with up(k) and down(j)
    -- https://youtu.be/w7i4amO_zaE?si=UiyaDMFy7e5VJnoP&t=1534
    -- v = visual, J = Shift J
    -- NOTE: TODO: Replace with mini.move?
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text" })
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text" })

    -- Create a new line before put with Shift-\P or after with \p keep cursor position
    -- \p
    vim.keymap.set(
        "n",
        "<Leader>p",
        "mz:put<CR>`z",
        { desc = "Put yanked text below cursor without jump" }
    )
    -- \P
    vim.keymap.set(
        "n",
        "<Leader>P",
        "mz:put!<CR>`z",
        { desc = "Put yanked text above cursor without jump" }
    )

    -- Inset a new line below with \o or new line above with \O while staying in normal mode
    -- without switching cursor positions
    -- \o
    vim.keymap.set("n", "<Leader>o", "mz:put _<CR>`z", {
        desc = "Insert new line below without entering insert mode",
    })
    -- \O
    vim.keymap.set("n", "<Leader>O", "mz:put! _<CR>`z", {
        desc = "insert new line above without entering insert mode",
    })

    -- \WF
    vim.keymap.set("n", "<Leader>WF", ":w !sudo tee %", {
        desc = "Force save as sudo",
    })

    -- Save myself from my sloppy typing of :q
    vim.keymap.set("n", "q", "<nop>", { noremap = true })
    vim.keymap.set("n", "q", "<nop>", { noremap = true })
    vim.keymap.set("n", "Q", "q", { noremap = true, desc = "Record macro" })
    vim.keymap.set("n", "<M-q>", "Q", { noremap = true, desc = "Replay last register" })

    -- Buffer navigation
    -- \Tab
    -- \Shift-Tab
    vim.keymap.set("n", "<Leader><Tab>", ":bnext<CR>", { desc = "Cycle to next buffer" })
    vim.keymap.set("n", "<Leader><S-Tab>", ":bprev<CR>", { desc = "Cycle to next buffer" })

    -- \d Jump to the next diagnostic and show floating window
    local diagnostic_jump_show = function()
        vim.diagnostic.jump { count = 1, wrap = true }
        vim.diagnostic.show()
    end
    vim.keymap.set(
        "n",
        "<Leader>d",
        diagnostic_jump_show,
        { desc = "Jump to the next diagnostic and show floating window" }
    )

    -- Toggle nvim-tree file explorer
    -- Ctrl-n
    local nvim_tree_toggle = function()
        local tree = require("nvim-tree.api").tree
        tree.toggle { find_file = true, focus = false }
    end
    vim.keymap.set("n", "<C-n>", nvim_tree_toggle, { desc = "nvimtree toggle window" })

    -- nvchad fzf theme switcher
    -- \th
    local theme_switcher = function()
        require("nvchad.themes").open()
    end
    vim.keymap.set("n", "<leader>th", theme_switcher, { desc = "Switch nvchad themes" })

    -- Fzf.lua fuzzy find find files from cwd
    -- \ff
    local fzf_cwd = function()
        local tree = require("nvim-tree.api").tree
        tree.close() -- close file explorer to prevent glitching it's buffer
        require("fzf-lua").files()
    end
    vim.keymap.set("n", "<leader>ff", fzf_cwd, { desc = "Launch fzf.lua to find files" })

    -- Fzf.luz fizzy find files from $HOME
    -- \<Space><Space>
    local fzf_home = function()
        local tree = require("nvim-tree.api").tree
        tree.close() -- close file explorer to prevent glitching it's buffer
        require("fzf-lua").files { cwd = "~/" }
    end
    vim.keymap.set(
        "n",
        "<leader><Space><Space>",
        fzf_home,
        { desc = "Launch fzf.lua to find files" }
    )

    vim.keymap.set("n", "<leader>fs", function()
        require("fzf-lua").lsp_document_symbols()
    end, { desc = "Find symbols in document" })
    vim.keymap.set("n", "<leader>fS", function()
        require("fzf-lua").lsp_workspace_symbols()
    end)
    vim.keymap.set("n", "<leader>fw", function()
        require("fzf-lua").lsp_live_workspace_symbols()
    end)
end
return M
