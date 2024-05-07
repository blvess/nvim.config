return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	config = function()
		require("crates").setup({
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
			src = {
				cmp = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		})
	end,
}
