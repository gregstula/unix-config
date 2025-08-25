local M = {}
function M.setup()
    return {
        -- Let's lua LSP understand neovim config files - in a fast and performant way
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
            "j-hui/fidget.nvim",
            opts = {},
        },
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        {
            -- Auto format on save
            "stevearc/conform.nvim",
            opts = {
                formatters_by_ft = {
                    lua = { "stylua" },
                    bash = { "shfmt" },
                    zsh = { "shfmt" },
                    sh = { "shfmt" },
                    go = { "gofmt" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    cpp = { "clang-format" },
                },
                format_on_save = {
                    timeout_ms = 500,
                },
            },
        },
        { -- linters for where they still make more sense than lsps
            "mfussenegger/nvim-lint",
            config = function()
                require("lint").linters_by_ft = {
                    systemd = { "systemd-analyze" },
                    vim.cmd "au BufWritePost * lua require('lint').try_lint()",
                }
            end,
        },
    }
end

function M.configure()
    -- lsp setup here
    vim.lsp.enable "clangd"
    vim.lsp.enable "rust_analyzer"
    vim.lsp.enable "systemd-language-server"
    vim.lsp.enable "bash-language-server"
    vim.lsp.enable "lua-language-server"
    vim.lsp.enable "gopls"
end

return M
