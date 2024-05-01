return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mxsdev/nvim-dap-vscode-js",
    "nvim-neotest/nvim-nio",
	},
	config = function()
		local dapjs = require("dap-vscode-js")
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

		dapjs.setup({
			debugger_path = os.getenv("HOME") .. "/projects/vscode-js-debug",
			node_path = os.getenv("HOME") .. "/.nvm/versions/node/v18.16.0/bin/node",
			adapters = {
				"chrome",
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
				"node",
			},
		})

		for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

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

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
		vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
		vim.keymap.set("n", "<Leader>dg", ":DapStepOut<CR>")
	end,
}
