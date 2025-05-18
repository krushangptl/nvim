-- === ~/.config/nvim/lua/krushang/init.lua ===

print("get fixed boi!")

-- === leader key ===
vim.g.mapleader = " "

-- test leader
vim.keymap.set("n", "<leader>ef", ":Ex<CR>", { desc = "Editor to NETRW" })

-- undo tree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

-- === telescope keymaps ===
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "telescope find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "telescope help tags" })

-- === treesitter configurations ===
require("nvim-treesitter.configs").setup({
    -- a list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

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

-- === which key configuration! ===

require("which-key").setup({
    -- keys = "<c-w>",
    -- loop = true, -- this will keep the popup open until you hit <esc>
})

-- === mini configurations ===
-- () {} [] , surround
require("mini.surround").setup()
-- '' "", pairs
require("mini.pairs").setup()
-- good comments
require("mini.comment").setup()
-- status line
require("mini.statusline").setup()

-- === tags configuration ===
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

-- === indent blank line ===
-- require("ibl").setup()

-- === Mason configuration ===
require("mason").setup()
-- require("mason-lspconfig").setup({
--     ensure_installed = { "lua_ls", "pyright", "ruff", "ts_ls", "clangd", "html", "gopls" }, -- Add LSPs you need
--     automatic_installation = true,
-- })

-- === LSP configuration ===
local lspconfig = require("lspconfig")

-- require("mason-lspconfig").setup_handlers({
--     function(server_name) -- Default handler for all LSPs
--         lspconfig[server_name].setup({})
--     end,
-- })

-- Manual LSP Configuration

-- c language
lspconfig.clangd.setup({})

-- typescript/javascript language
lspconfig.ts_ls.setup({})

-- go language
lspconfig.gopls.setup({})

-- python language
lspconfig.pyright.setup({})

-- lua languag
lspconfig.lua_ls.setup({})

-- === cmp configuration ===
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

-- === lsp keymaps ===
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

-- === lsp based formatting ===
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- === Dap UI Configuration ===
local dapui = require("dapui")

-- === Dapui keymaps ===
-- === Key mapping to open DAPUI ===
vim.api.nvim_set_keymap("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })

-- === Key mapping to set or toggle breakpoint ===
vim.api.nvim_set_keymap(
    "n",
    "<leader>db",
    '<cmd>lua require("dap").toggle_breakpoint()<CR>',
    { noremap = true, silent = true }
)

-- === Debug operations ===
-- === Key mapping to continue execution ===
vim.api.nvim_set_keymap("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })

-- === Key mapping to step into ===
vim.api.nvim_set_keymap("n", "<leader>di", '<cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })

-- === Key mapping to step over ===
vim.api.nvim_set_keymap("n", "<leader>do", '<cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })

-- === Key mapping to step out ===
vim.api.nvim_set_keymap("n", "<leader>ds", '<cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })

-- === Key mapping to restart the debug session ===
vim.api.nvim_set_keymap(
    "n",
    "<leader>dr",
    '<cmd>lua require("dap").repl.restart()<CR>',
    { noremap = true, silent = true }
)

-- === Key mapping to close DAPUI ===
vim.api.nvim_set_keymap("n", "<leader>dx", '<cmd>lua require("dapui").close()<CR>', { noremap = true, silent = true })

-- === Key mapping to evaluate expression under the cursor ===
vim.api.nvim_set_keymap(
    "n",
    "<leader>de",
    '<cmd>lua require("dap.ui.variables").hover()<CR>',
    { noremap = true, silent = true }
)

-- === Key mapping to evaluate selection ===
vim.api.nvim_set_keymap(
    "v",
    "<leader>de",
    '<cmd>lua require("dap.ui.variables").visual_hover()<CR>',
    { noremap = true, silent = true }
)

-- === Dap configuration ===

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

-- === Neodev configuration ===
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- === Git Configurations ===
require("gitsigns").setup()

-- === Keymap for gitsings ==
vim.keymap.set("n", "<leader>h", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

--- === BLAZING KEY-MAPS ===

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
