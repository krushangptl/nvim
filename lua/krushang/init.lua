-- ~/.config/nvim/lua/krushang/init.lua

print("Radhey Radhey")

-- Leader key 
vim.g.mapleader = " "

-- Test leader 
vim.keymap.set("n", "<leader>ef", ":Ex<CR>", { desc = "Editor to NETRW" })

-- Undo tree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "telescope find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "telescope help tags" })

-- Blazing keymaps

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Treesitter
require("nvim-treesitter.configs").setup({
    -- a list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "javascript", "html", "css" },

    -- install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- automatically install missing parsers when entering buffer
    -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },
})

-- Auto tag configuration 
require("nvim-ts-autotag").setup({
    opts = {
        -- defaults
        enable_close = true,           -- auto close tags
        enable_rename = true,          -- auto rename pairs of tags
        enable_close_on_slash = false, -- auto close on trailing </
    },
    -- also override individual filetype configs, these take priority.
    -- empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    per_filetype = {
        ["html"] = {
            enable_close = true,
        },
    },
})

-- Git configuration
require("gitsigns").setup()

vim.keymap.set("n", "<leader>h", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Mini configurations 
-- Statusline for goods
-- require("mini.statusline").setup()

-- Mason, Language server protocol, Snippets

require("mason").setup()

local lspconfig = require("lspconfig")

-- for lua language 
lspconfig.lua_ls.setup({})

-- for python language
lspconfig.pyright.setup({})

-- for c language 
lspconfig.clangd.setup({})

-- for go language 
lspconfig.gopls.setup({})

-- Lsp based keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

-- for Web Development 
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md", "*.yml" },
  callback = function()
    vim.fn.jobstart({ "prettier", "--write", vim.fn.expand("%") }, {
      on_stdout = function(_, data) if data then print(table.concat(data, "\n")) end end,
      on_stderr = function(_, data) if data then print(table.concat(data, "\n")) end end,
      on_exit = function() vim.cmd("edit!") end, -- reload the buffer
    })
  end,
})

-- Cmp config
local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})

-- Debugging Environment 
local dapui = require("dapui")

vim.api.nvim_set_keymap("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })

-- Key mapping to set or toggle breakpoint
vim.api.nvim_set_keymap(
    "n",
    "<leader>db",
    '<cmd>lua require("dap").toggle_breakpoint()<CR>',
    { noremap = true, silent = true }
)

-- Debug operations 
-- Key mapping to continue execution 
vim.api.nvim_set_keymap("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })

-- Key mapping to step into 
vim.api.nvim_set_keymap("n", "<leader>di", '<cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })

-- Key mapping to step over 
vim.api.nvim_set_keymap("n", "<leader>do", '<cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })

-- Key mapping to step out 
vim.api.nvim_set_keymap("n", "<leader>ds", '<cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })

-- Key mapping to restart the debug session 
vim.api.nvim_set_keymap(
    "n",
    "<leader>dr",
    '<cmd>lua require("dap").repl.restart()<CR>',
    { noremap = true, silent = true }
)

-- Key mapping to close DAPUI 
vim.api.nvim_set_keymap("n", "<leader>dx", '<cmd>lua require("dapui").close()<CR>', { noremap = true, silent = true })

-- Key mapping to evaluate expression under the cursor 
vim.api.nvim_set_keymap(
    "n",
    "<leader>de",
    '<cmd>lua require("dap.ui.variables").hover()<CR>',
    { noremap = true, silent = true }
)

-- Key mapping to evaluate selection 
vim.api.nvim_set_keymap(
    "v",
    "<leader>de",
    '<cmd>lua require("dap.ui.variables").visual_hover()<CR>',
    { noremap = true, silent = true }
)

-- Dap configuration 

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Neodev configuration 
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})
