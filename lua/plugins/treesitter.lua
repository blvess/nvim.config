return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = "all",
			highlight = { enable = true },
		},
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},
}
