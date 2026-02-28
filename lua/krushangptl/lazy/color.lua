return {
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("gruber-darker")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
}
