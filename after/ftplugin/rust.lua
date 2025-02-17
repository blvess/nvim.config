local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<localleader>ga", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<localleader>tt", "<cmd>RustLsp testables<cr>", { desc = "Rust testables" })
