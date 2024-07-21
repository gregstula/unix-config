return {
    {
       --'fabius/molokai.nvim',
       --'UtkarshVerma/molokai.nvim',
       -- This is the classic OG molokai for oldVim
      'tomasr/molokai',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme molokai]])
            vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
            vim.cmd([[set termguicolors]])
        end,
    },
}
