local group = vim.api.nvim_create_augroup("autoread", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold", "BufEnter" }, {
	group = group,
	pattern = "*",
	callback = function()
		vim.cmd("checktime")
	end,
})
