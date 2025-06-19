-- ~/.config/nvim/packer.lua

-- Main Package Manager for Configurations

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) -- Packer can manage itself use 'wbthomason/packer.nvim' undo tree use("mbbill/undotree")
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Mark Down Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- Telescope fole search and ...
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- color theme
    use("zenbones-theme/zenbones.nvim")
    use("rose-pine/neovim")
    use("catppuccin/nvim")
    use("AlexvZyl/nordic.nvim")
    use("folke/tokyonight.nvim")

    -- treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- auto tags for web development
    use("windwp/nvim-ts-autotag")

    -- git integration
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- mini for goods
    use({
        "echasnovski/mini.nvim",
        version = false,
    })

    -- Language Server Protocol, Mason, Snippets
    use({ "neovim/nvim-lspconfig" })             -- Core LSP functionality
    use({ "williamboman/mason.nvim" })           -- LSP installer
    use({ "williamboman/mason-lspconfig.nvim" }) -- Bridges mason & lspconfig
    use({ "hrsh7th/nvim-cmp" })                  -- Autocompletion engine
    use({ "hrsh7th/cmp-nvim-lsp" })              -- LSP completion source
    use({ "hrsh7th/cmp-buffer" })                -- Buffer words completion
    use({ "hrsh7th/cmp-path" })                  -- Path completion
    use({ "L3MON4D3/LuaSnip" })                  -- Snippet engine
    use({ "nvimtools/none-ls.nvim" })            -- Formatting and Linting

    -- Debugging environment
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
    use("folke/neodev.nvim")
end)
