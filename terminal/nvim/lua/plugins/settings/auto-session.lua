local M = {}
---enables autocomplete for opts
---@module "auto-session"
---@type AutoSession.Config
M.opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
}
function M.set_globals()
    vim.o.sessionoptions =
        "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
end

return M
