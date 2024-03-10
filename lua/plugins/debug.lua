return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{
				"mxsdev/nvim-dap-vscode-js",
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
			},
		},
		opts = {
			-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
			-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			executable = {
				-- command = "node",
				-- -- 💀 Make sure to update this path to point to your installation
				args = {
					vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
				command = "js-debug-adapter",
				-- args = { "${port}" },
			},
			adapters = {
				"chrome",
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
				"node",
				"chrome",
			}, -- which adapters to register in nvim-dap
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
		},
		config = function(_, opts)
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			-- reassign breakpoint characters
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

			vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>bc", dap.continue, {})

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

			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb", -- adjust as needed, must be absolute path
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					cwd = "${workspaceFolder}",
					name = "Launch",
					type = "lldb",
					args = {},
					request = "launch",
					stopOnEntry = false,
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			dap.adapters.go = {
				type = "executable",
				command = "node",
				args = {
					os.getenv("HOME")
						.. "/.local/share/nvim/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js",
				},
			}
			dap.configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					showLog = false,
					program = "${file}",
					dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
				},
			}

			require("dap-vscode-js").setup(opts)

			local js_based_languages = { "typescript", "javascript", "typescriptreact" }

			for _, language in ipairs(js_based_languages) do
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
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Start Chrome with "localhost"',
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
						userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
					},
				}
			end
		end,
	},
}
