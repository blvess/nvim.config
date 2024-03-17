return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	keys = {
		{ "<esc>", [[<C-\><C-n>]], mode = "t", desc = "ToggleTerm" },
		{ "<M-h>", ":ToggleTerm direction=horizontal<CR>", desc = "ToggleTerm horizontal" },
		{ "<M-v>", ":ToggleTerm direction=vertical<CR>", desc = "ToggleTerm vertical" },
		{ "<M-f>", ":ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<C-\>]],
		direction = "float",
		float_opts = {},
	},
}
