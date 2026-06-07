return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"https://codeberg.org/evergarden/nvim.git",
		config = function()
			-- vim.cmd.colorscheme("evergarden")
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruber-darker")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		-- Add in any other configuration;
		--   event = foo,
		--   config = bar
		--   end,
		config = function()
			-- vim.cmd("colorscheme oxocarbon")
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
			-- vim.cmd("colorscheme vague")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			-- vim.g.zenbones_darken_comments = 45
			-- vim.cmd.colorscheme("zenbones")
		end,
	},
	{
		"savq/melange-nvim",
		config = function()
			-- vim.cmd.colorscheme("melange")
		end,
	},
}
