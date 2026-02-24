vim.g.mapleader 	= " "
vim.g.maplocalleader 	= " "

local map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Yank to system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Netrw
map("n", "<leader>e", "<cmd>Explore<CR>")
map("n", "<leader>E", "<cmd>Lexplore<CR>")

