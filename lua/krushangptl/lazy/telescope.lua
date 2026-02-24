return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>sg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
        { "<leader>sb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
        { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
    },
}
