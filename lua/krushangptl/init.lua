print("Shree Radhey")

vim.g.mapleader=" " 

-- testing leader key 
vim.keymap.set("n", "<leader>ef", ":Ex<CR>", {desc = "Editor to NETRW"})

-- Test leader
vim.keymap.set("n", "<leader>ef", ":Ex<CR>", { desc = "Editor to NETRW" })

-- Undo tree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undo Tree"})

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
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "bash",
        "javascript", "typescript", "tsx", "html", "css",
        "json", "yaml", "toml", "svelte", "vue", "go"
    },

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

-- Treesitter context (sticky header of current scope)
pcall(require, "treesitter-context")

-- Auto tag configuration
require("nvim-ts-autotag").setup({
    opts = {
        -- defaults
        enable_close = true,     -- auto close tags
        enable_rename = true,    -- auto rename pairs of tags
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

-- Mini config
-- Statusline for goods
require("mini.statusline").setup()

-- LSP (mason + mason-lspconfig + lspconfig)
-- Diagnostics UI
vim.diagnostic.config({
    signs = true,
    underline = true,
    virtual_text = true,
    update_in_insert = false,
})

-- Capabilities for nvim-cmp completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Common on_attach: buffer keymaps
local function on_attach(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

-- Ensure tools are available
local mason_ok, mason = pcall(require, 'mason')
if mason_ok then mason.setup() end

-- Native Neovim LSP configuration (no lspconfig)
vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.config('pyright', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
})

-- clangd (C/C++)
vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
})

-- gopls (Go)
vim.lsp.config('gopls', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
})

-- HTML
vim.lsp.config('html', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'templ', 'htmldjango' },
    settings = {
        html = { format = { wrapLineLength = 120, unformatted = 'code,pre,em,strong,span' } },
    },
})

-- CSS / SCSS / Less
vim.lsp.config('cssls', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'css', 'scss', 'less' },
})

vim.lsp.enable({ 'lua_ls', 'pyright', 'clangd', 'gopls', 'html', 'cssls' })

-- Cmp config
local cmp = require("cmp")
local ok_tw_cmp, tw_colorizer_cmp = pcall(require, 'tailwindcss-colorizer-cmp')
if ok_tw_cmp then
    tw_colorizer_cmp.setup()
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = ok_tw_cmp and { format = tw_colorizer_cmp.formatter } or nil,
})

-- Colorizer (CSS colors in code)
pcall(function()
    require('colorizer').setup()
end)

-- Which-key
pcall(function()
    require('which-key').setup()
end)

-- Tailwind tools (class sorting, color hints)
pcall(function()
    require('tailwind-tools').setup({})
end)
