return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		require("nvim-treesitter").install({
			"lua",
			"c",
			"cpp",
			"python",
			"javascript",
			"typescript",
			"bash",
			"rust",
		})

		-- Enable highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "c", "cpp", "python", "javascript", "typescript", "bash", "rust", "go" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- Enable indentation (experimental)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
