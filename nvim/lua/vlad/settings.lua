require("vlad.keymaps") -- Key maps config file
require("vlad.lazy") -- lazy package manager config file

-- Basic editor settings
vim.opt.number = true                   -- Add line numbers
vim.opt.relativenumber = true           -- Turn on relative line numbers
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.tabstop = 4                     -- Number of columns per tab
vim.opt.softtabstop = 4                 -- Backspace deletes 4 spaces
vim.opt.expandtab = true                -- Convert tabs to spaces
vim.opt.shiftwidth = 4                  -- Auto-indent width
vim.opt.autoindent = true               -- Keep indent from previous line
vim.opt.colorcolumn = "80"              -- Show vertical line at column 80
vim.opt.cursorline = true               -- Highlight current line
vim.o.wrap = false                      -- Disable line wrapping on new linesi

-- Entering Insert mode turns off relative line numbers
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
    end,
})

-- Exiting insert mode turns on relative line numbers
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
    end,
})


-- Syntax and filetype support
vim.cmd("syntax on")                      -- Syntax highlighting
vim.cmd("filetype plugin indent on")      -- Enable filetype-based plugins and indentation
