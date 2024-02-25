return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>xx", "<CMD>TroubleToggle<CR>", desc = "Trouble Toggle" },
		{ "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble Toggle Workspace Diagnostics" },
		{ "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Trouble Toggle Document Diagnostics" },
		{ "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", desc = "Trouble Toggle Quickfix" },
		{ "<leader>xl", "<CMD>TroubleToggle loclist<CR>", desc = "Trouble Toggle Location List" },
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
