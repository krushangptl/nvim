return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.statusline").setup({
			use_icons = true, -- set false if no nerd font
		})
	end,
}
