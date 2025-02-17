return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"rayliwell/tree-sitter-rstml",
		},
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			require("nvim-ts-autotag").setup({})
			require("tree-sitter-rstml").setup()
			configs.setup({
				modules = {},
				auto_install = true,
				ignore_install = {},
				ensure_installed = "all",
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
