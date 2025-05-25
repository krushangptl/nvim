-- init.lua by Krushang

-- === linking ===
require("krushang")

-- === color-theme ===
vim.cmd.colorscheme("rose-pine")

-- === settings ===

-- vim.opt.guicursor = "" -- vim feel
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

-- enable syntax highlighting
vim.cmd("syntax enable")

-- enable filetype detection, plugins, and indentation
vim.cmd("filetype plugin indent on")

-- search
vim.opt.hlsearch = false
vim.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- spelling and en..
vim.opt.spelllang = "en"
vim.opt.spell = true

-- structured way to arrange editor
vim.opt.colorcolumn = "90"

-- status line
vim.opt.showmode = false

-- === editor transparency ===
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi EndOfBuffer guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi CursoreLine guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi CursoreLineNr guibg=NONE ctermbg=NONE ]])
