return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"nvim-telescope/telescope-dap.nvim",
		{
			"folke/neodev.nvim",
			opts = {
				library = { plugins = { "nvim-dap-ui" }, types = true },
			},
		},
	},
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			silent = true,
		},
	},

	lazy = false,

	-- keys = {
	-- 	{ "n", "<F5>", "<cmd>DapContinue<CR>" },
	-- 	{ "n", "<F9>", "<cmd>DapToggleBreakpoint<CR>" },
	-- 	{ "n", "<F10>", "<cmd>DapStepOver<CR>" },
	-- 	{ "n", "<F11>", "<cmd>DapStepInto<CR>" },
	-- 	{ "n", "<F12>", "<cmd>DapSetpOut<CR>" },
	-- },

	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		local dapgo = require("dap-go")
		local virtual_text = require("nvim-dap-virtual-text")

		virtual_text.setup()
		dapui.setup()
		dapgo.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.after.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.after.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F12>", dap.step_out)
	end,
}
