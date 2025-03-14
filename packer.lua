-- Installation of Pluginspack

----------------------------------------------
-- Plugins Info

-- packer configuration and plugin itself
-- all that exist in ~/.config/nvim/lua/krushang/init.lua
----------------------------------------------

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Color theme for fast coding
    use("rose-pine/neovim")
    use("morhetz/gruvbox")
    -- Telescope file search and more
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter color variation
    use("nvim-treesitter/nvim-treesitter")

    -- Which Key!
    use("folke/which-key.nvim")

    -- Mini for good
    use({
        "echasnovski/mini.nvim",
        version = false,
    })

    use("windwp/nvim-ts-autotag")
    -- use("lukas-reineke/indent-blankline.nvim")

    -- === lsp configuration || snippet || lsp formatting ===
    use { "neovim/nvim-lspconfig" }             -- Core LSP functionality
    use { "williamboman/mason.nvim" }           -- LSP installer
    use { "williamboman/mason-lspconfig.nvim" } -- Bridges mason & lspconfig
    use { "hrsh7th/nvim-cmp" }                  -- Autocompletion engine
    use { "hrsh7th/cmp-nvim-lsp" }              -- LSP completion source
    use { "hrsh7th/cmp-buffer" }                -- Buffer words completion
    use { "hrsh7th/cmp-path" }                  -- Path completion
    use { "L3MON4D3/LuaSnip" }                  -- Snippet engine

    -- === Debugging Setups ===
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

    -- === Neodev ===
    use("folke/neodev.nvim")

    -- === Git integration ===
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- === Mark Down Preview ===
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
end)
