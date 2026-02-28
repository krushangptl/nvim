return {
    "neovim/nvim-lspconfig", -- still needed for server definitions
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "clangd",
            },
            automatic_installation = true,
        })

        local capabilities = cmp_lsp.default_capabilities()

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end

        local servers = { "lua_ls", "pyright", "tsserver" }

        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            vim.lsp.enable(server)
        end
    end,
}
