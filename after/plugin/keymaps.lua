local map = vim.keymap.set

-- Navigation
map("t", "<C-h>", "<cmd>wincmd h<CR>", { silent = true, desc = "Move Left" })
map("t", "<C-j>", "<cmd>wincmd j<CR>", { silent = true, desc = "Move Down" })
map("t", "<C-k>", "<cmd>wincmd k<CR>", { silent = true, desc = "Move Up" })
map("t", "<C-l>", "<cmd>wincmd l<CR>", { silent = true, desc = "Move Right" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Lazy
map("n", "<leader>u", "<cmd>Lazy sync<cr>", { silent = true, desc = "Lazy Sync" })

-- Toggle
map("n", "<leader>w", "<cmd>set wrap!<cr>", { silent = true, desc = "Toggle Wrap" })
map("n", "<leader>l", "<cmd>set list!<cr>", { silent = true, desc = "Toggle List" })

-- Clear Highlight
map("n", "<cr>", ":noh<cr><cr>", { silent = true, desc = "Clear Highlight" })

-- Close current buffer
map("n", "<leader>xd", ":bdelete<cr>", { silent = true, desc = "Close buffer" })
-- Cleanup open buffers
map("n", "<leader>cb", ":%bd|e#|bd#<cr>|'\"", { silent = true, desc = "Cleanup open buffer" })

-- Block Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move Line Up" })

--

-- LSP Actions
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
		end, opts)
	end,
})
