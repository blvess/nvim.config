return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Move to previous/next first/last
		map("n", "[b", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "]b", "<Cmd>BufferNext<CR>", opts)
		map("n", "]B", "<Cmd>BufferLast<CR>", opts)
		map("n", "[B", "<Cmd>BufferFirst<CR>", opts)
		-- Goto buffer in position...
		map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
	end,
	opts = {
		-- Set the filetypes which barbar will offset itself for
		-- sidebar_filetypes = {
		-- 	["neo-tree"] = { event = "BufWipeout" },
		-- },
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
