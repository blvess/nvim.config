return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	keys = {
		{ "<leader>p", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", desc = "Copilot Toggle" },
	},

	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<LocalLeader>c",
				},
				layout = {
					position = "right", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<C-e>",
					next = "<C-.>",
					prev = "<C-,>",
				},
			},
		})
	end,
}
