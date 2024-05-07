return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
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
	lazy = false,
	keys = {
		{ "<F5>", "<cmd>DapContinue<CR>" },
		{ "<F9>", "<cmd>DapToggleBreakpoint<CR>" },
		{ "<F10>", "<cmd>DapStepOver<CR>" },
		{ "<F11>", "<cmd>DapStepInto<CR>" },
		{ "<F12>", "<cmd>DapSetpOut<CR>" },
	},

	config = function()
		local dapui = require("dapui")
		local dap = require("dap")

		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()

		dapui.setup()

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
	end,
}
