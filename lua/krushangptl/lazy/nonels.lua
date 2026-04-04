return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local null_ls = require("null-ls")

		-- Setup null-ls
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.black,
			},
		})

		-- Create augroup to avoid duplicate autocmds
		local group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

		-- Format on save (triggered by :w)
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = group,
			pattern = { "*.lua", "*.py" }, -- restrict to your formatters
			callback = function()
				vim.lsp.buf.format({
					async = false, -- block until formatting finishes
					filter = function(client)
						return client.name == "null-ls" -- only use null-ls
					end,
				})
			end,
		})
	end,
}
