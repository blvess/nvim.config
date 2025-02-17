return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		-- lint.linters.eslint_d.args = {
		-- 	"--no-warn-ignored",
		-- }

		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			svelte = { "eslint" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.diagnostic.config({ virtual_text = true })
	end,
}
