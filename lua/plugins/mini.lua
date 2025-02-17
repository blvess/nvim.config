return {
	{ "echasnovski/mini.bracketed", version = false, config = true },
	{ "echasnovski/mini.comment", version = false, config = true },
	{ "echasnovski/mini.surround", version = false, config = true },
	{ "echasnovski/mini.ai", version = false, config = true },
	{ "echasnovski/mini.diff", version = false },
	{ "echasnovski/mini.pairs", version = false, config = true },
	{ "echasnovski/mini.statusline", version = false, config = true },
	{
		"echasnovski/mini.hipatterns",
		version = false,
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
	{ "echasnovski/mini.animate", version = false, config = true },
	{ "echasnovski/mini.indentscope", version = false, opts = { symbol = "▎" } },
}
