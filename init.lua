-- ~/.config/nvim/init.lua

require("krushang")

-- settings

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50

vim.cmd("syntax enable")

vim.cmd("filetype plugin indent on")

vim.opt.hlsearch = false
vim.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.spelllang = "en"

-- Apply after setting colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi CursorLine guibg=NONE ctermbg=NONE ]])
    vim.cmd([[ hi CursorLineNr guibg=NONE ctermbg=NONE ]])
  end,
})

-- colorschemes 
vim.cmd.colorscheme("tokyonight-storm")

-- structurrd way to arrange editor
vim.opt.colorcolumn = "90"
