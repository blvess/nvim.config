return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"nvim-telescope/telescope-dap.nvim",
	},
	lazy = false,
	keys = {
		{ "<localleader>dc", "<cmd>DapContinue<CR>" },
		{ "<localleader>dx", ':lua require("dapui").close() <CR>', silent = true },
		{ "<localleader>db", "<cmd>DapToggleBreakpoint<CR>" },
		{ "<localleader>ds", "<cmd>DapStepOver<CR>" },
		{ "<localleader>dn", "<cmd>DapStepInto<CR>" },
		{ "<localleader>do", "<cmd>DapSetpOut<CR>" },
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup({})

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
	end,
}
