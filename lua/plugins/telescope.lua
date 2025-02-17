return {
	"nvim-telescope/telescope.nvim",

	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		{ "<leader>f", "<cmd>Telescope file_browser<cr>", desc = "Telescope Browser" },
		{ "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "Telescope Keymaps", noremap = true },
		{ "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Telescope Search" },
		{ "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostics" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope Find Buffers" },
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-dap.nvim",
	},

	lazy = false,

	config = function()
		local telescope = require("telescope")

		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
					},
					width = 0.8,
					height = 0.8,
					preview_cutoff = 120,
				},
				sorting_strategy = "ascending",
				winblend = 0,
			},
			file_ignore_patterns = {
				"__pycache__/",
				"node_modules",
				".git",
				"Cargo.lock",
				"package-lock.json",
				"yarn.lock",
				".gitignore",
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("dap")
		telescope.load_extension("file_browser")
	end,
}
