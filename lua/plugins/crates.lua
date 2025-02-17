return {
	"saecki/crates.nvim",
	config = function()
		require("crates").setup({
			lsp = {
				enabled = true,
				hover = true,
				actions = true,
				completion = true,
			},
			completion = {
				cmp = {
					enabled = true,
				},
				crates = {
					enabled = true,
					min_chars = 3,
					max_results = 8,
				},
			},
		})
	end,
}
