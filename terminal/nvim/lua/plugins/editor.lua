local M = {}
function M.setup()
    return {
        "rmagatti/auto-session",
        lazy = false,
        init = require("plugins.settings.auto-session").set_globals(),
        opts = require("plugins.settings.auto-session").opts,
    }
end

function M.configure()
    -- Workaround for auto-session and nvim-tree to play nice
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "NvimTree*",
        callback = function()
            local api = require "nvim-tree.api"

            if not api.tree.is_visible() then
                api.tree.open()
            end
        end,
    })
end

return M
