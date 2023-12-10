return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "dev-v3",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"windwp/nvim-autopairs",
		"simrat39/rust-tools.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		local cmp_format = lsp_zero.cmp_format()

		require("luasnip.loaders.from_vscode").lazy_load()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		require("nvim-autopairs").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "rust_analyzer" },
			handlers = {
				lsp_zero.default_setup,

				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,

				rust_analyzer = function()
					local rust_tools = require("rust-tools")
					rust_tools.setup({
						tools = {
							executor = require("rust-tools.executors").toggleterm,
						},
						server = {
							on_attach = function(_, bufnr)
								vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
							end,
							settings = {
								["rust-analyzer"] = {
									check = {
										command = "clippy",
										features = "all",
									},
									cargo = {
										features = "all",
									},
								},
							},
						},
					})
				end,
			},
		})

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			formatting = cmp_format,
		})
	end,
}
