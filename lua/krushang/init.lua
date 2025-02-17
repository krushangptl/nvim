-- === ~/.config/nvim/lua/krushang/init.lua ===

print("get fixed boi!")

-- === leader key ===
vim.g.mapleader = " "

-- test leader
vim.keymap.set("n", "<leader>ef", ":Ex<CR>", { desc = "Editor to NETRW" })

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
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ruff", "ts_ls" }, -- Add LSPs you need
    automatic_installation = true,
})

-- === LSP configuration ===
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
    function(server_name) -- Default handler for all LSPs
        lspconfig[server_name].setup({})
    end
})

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
        { name = "path" }
    })
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
