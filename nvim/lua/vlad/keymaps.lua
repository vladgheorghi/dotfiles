vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Enter explorer mode
map("n", "<leader>pv", vim.cmd.Ex)

-- Window Navigation
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Right>", "<C-w>l")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Down>", "<C-w>j")

-- Resize Windows
map("n", "<C-h>", "<C-w><")
map("n", "<C-l>", "<C-w>>")
map("n", "<C-j>", "<C-w>+")
map("n", "<C-k>", "<C-w>-")
