return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
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
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		"folke/neoconf.nvim",
		"windwp/nvim-autopairs",
	},
	config = function()
		require("neoconf").setup()

		local lsp_zero = require("lsp-zero")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_action = lsp_zero.cmp_action()
		local cmp_format = lsp_zero.cmp_format()

		require("luasnip.loaders.from_vscode").lazy_load()

		lsp_zero.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr }
			lsp_zero.default_keymaps(opts)

			vim.keymap.set({ "n", "x" }, "gq", function()
				vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
			end, opts)

			vim.keymap.set("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, opts)
		end)

		lsp_zero.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		require("lspconfig").gopls.setup({
			cmd = { "gopls" },
		})

		require("nvim-autopairs").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "tsserver", "lua_ls" },
			handlers = {
				lsp_zero.default_setup,

				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				rust_analyzer = lsp_zero.noop,
			},
		})

		lsp_zero.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["rust-analyzer"] = { "rust" },
			},
		})

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			formatting = cmp_format,
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							cmp.confirm()
						end
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i" }),
				["<C-e>"] = {
					i = function()
						pcall(require("copilot.suggestion").accept)
					end,
				},
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-x>"] = cmp.mapping.abort(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "crates" },
			},
		})
	end,
}
