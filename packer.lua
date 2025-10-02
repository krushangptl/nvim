-- Main Package Manager for Configurations

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) -- Packer can manage itself use 'wbthomason/packer.nvim' undo tree use("mbbill/undotree")
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- color configs
    use("savq/melange-nvim")

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

    -- treesitter
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/nvim-treesitter-context")

    -- auto tags for web development
    use("windwp/nvim-ts-autotag")
    use("NvChad/nvim-colorizer.lua")
    use({ "folke/which-key.nvim" })
    use({ "roobert/tailwindcss-colorizer-cmp.nvim" })
    use({ "luckasRanarison/tailwind-tools.nvim" })
    use({ "mattn/emmet-vim" })

    -- git integration
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- mini for goods
    use({
        "echasnovski/mini.nvim",
        version = false,
    })

    -- Language Server Protocol, Mason, Snippets
    use({ "williamboman/mason.nvim" })           -- LSP installer
    use({ "hrsh7th/nvim-cmp" })                  -- Autocompletion engine
    use({ "hrsh7th/cmp-nvim-lsp" })              -- LSP completion source
    use({ "hrsh7th/cmp-buffer" })                -- Buffer words completion
    use({ "hrsh7th/cmp-path" })                  -- Path completion
    use({ "saadparwaiz1/cmp_luasnip" })          -- Snippet source for cmp
    use({ "L3MON4D3/LuaSnip" })                  -- Snippet engine
    use({ "rafamadriz/friendly-snippets" })      -- Snippet collection
    use({ "nvimtools/none-ls.nvim" })            -- Formatting and Lintingend)

end)
