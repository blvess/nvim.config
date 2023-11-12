return {
	"nvim-telescope/telescope.nvim",

	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope Find Buffers" },
		{ "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
		{ "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Live Grep" },
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	lazy = false,

	config = function()
		local telescope = require("telescope")

		require("telescope").setup({
			file_ignore_patterns = {
				"__pycache__/",
				"node_modules/",
				".git/",
				"Cargo.lock",
				"package-lock.json",
				"yarn.lock",
				".gitignore",
			},
		})

		telescope.setup({})
		telescope.load_extension("fzf")
	end,
}
