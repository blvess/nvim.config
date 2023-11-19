return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		source_selector = {
			winbar = true,
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfilees = true,
				hide_hidden = true,
				always_show = {
					".gitignore",
					".luarc.json",
				},
			},
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
	},
}
