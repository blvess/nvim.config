return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			on_colors = function() end,
			on_highlights = function(hl, c)
				local prompt = "#2d3149"
				hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
				hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
				hl.TelescopePromptNormal = { bg = prompt }
				hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
				hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
				hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
				hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
			end,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
