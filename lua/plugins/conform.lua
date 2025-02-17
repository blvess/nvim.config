vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader><leader>",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			toml = { "taplo" },
			markdown = { "prettier" },
			rust = { "rustfmt", "leptosfmt", lsp_format = "fallback" },
			c = { "clang-format" },
			go = { "goimports", "gofumpt" },
			sql = { "sql-formatter" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters = {
			prettier = {
				options = {
					ext_parsers = {
						tmpl = "html",
					},
				},
			},
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
