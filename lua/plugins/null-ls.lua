return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
    "nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = { "stylua", "black", "prettierd", "eslint", "rustfmt" },
			handlers = {},
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
