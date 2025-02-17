vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set tmpl to use html snippets",
	pattern = "*.tmpl",
	command = "set filetype=html",
})
