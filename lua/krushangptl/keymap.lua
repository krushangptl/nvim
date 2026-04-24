vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Auto cmd

-- Remove extraspace in line with save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Get back to point where left
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line_count = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- no line number in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- auto insert in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	command = "startinsert",
})

-- split resize
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- cursor line in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	command = "set cursorline",
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	command = "set nocursorline",
})

-- spell check for markdown and txt
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text" },
	command = "setlocal spell",
})

-- faster setup for large file
vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function()
		local file = vim.fn.expand("<afile>")
		local size = vim.fn.getfsize(file)
		if size > 1024 * 1024 then -- 1MB
			vim.opt_local.syntax = "off"
			vim.opt_local.swapfile = false
		end
	end,
})
