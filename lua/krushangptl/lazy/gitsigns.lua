return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup()

        local map = vim.keymap.set

        map("n", "<leader>h", function()
            require("gitsigns").preview_hunk()
        end, { desc = "Preview Hunk" })

        map("n", "<leader>gt", function()
            require("gitsigns").toggle_current_line_blame()
        end, { desc = "Toggle Line Blame" })
    end,
}
