return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	lazy = false,
	keys = {
		{ "zR", ":lua require('ufo').openAllFolds()<cr>", silent = true, desc = "Open All Folds" },
		{ "zM", ":lua require('ufo').closeAllFolds()<cr>", silent = true, desc = "Close All Folds" },
		{ "zr", ":lua require('ufo').openFoldsExceptKinds()<cr>", silent = true, desc = "Open All Folds" },
		{ "zm", ":lua require('ufo').closeFoldsWith(0)<cr>", silent = true, desc = "Close All Folds" },
	},
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
