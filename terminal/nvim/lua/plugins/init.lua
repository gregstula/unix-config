local M = {}

function M.bootstrap()
    -- Plugin theming
    -- Set up base46 path theme plugin before Lazy so themes apply to plugins
    vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

    -- Set lazypath and bootstrap
    local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system {
            "git",
            "clone",
            "--filter=blob:none",
            "--branch=stable",
            lazyrepo,
            lazypath,
        }
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.setup()
    local completion = require "plugins.completion"
    local editor = require "plugins.editor"
    local lsp = require "plugins.lsp"
    local treesitter = require "plugins.treesitter"
    local ui = require "plugins.ui"
    require("lazy").setup {
        spec = {
            completion.setup(),
            editor.setup(),
            lsp.setup(),
            treesitter.setup(),
            ui.setup(),
        },
    }
    completion.configure()
    editor.configure()
    lsp.configure()
    treesitter.configure()
    ui.configure()
end

return M
