return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local default_setup = function(server)
			local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()
			lspconfig[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		require("lspconfig")["zls"].setup({})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls", "clangd" },
			automatic_installation = false,
			handlers = {
				default_setup,

				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						on_init = function(client)
							client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = {
									version = "LuaJIT",
								},
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							})
						end,
						settings = {
							Lua = {},
						},
					})
				end,

				gopls = function()
					require("lspconfig").gopls.setup({
						settings = {
							gopls = {
								gofumpt = true,
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
							},
						},
					})
				end,
			},
		})
	end,
	vim.diagnostic.config({
		virtual_text = false,
	}),
}
