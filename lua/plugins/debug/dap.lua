local dap_function = function(func_name)
	return function()
		require("dap")[func_name]()
	end
end

local js_based_languages = {
	"vue",
	"astro",
	"svelte",
	"typescript",
	"javascript",
	"javascriptreact",
	"typescriptreact",
}

vim.fn.sign_define("DapBreakpoint", { text = "󰓛", texthl = "FloatBorder", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "󰐊", texthl = "", linehl = "", numhl = "" })

local dapui_config = {
	layouts = {
		{
			size = 40,
			position = "right",
			elements = {
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
		},
		{
			size = 10,
			position = "bottom", -- Can be "bottom" or "top"
			elements = { "repl", "console" },
		},
	},
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				virt_text_pos = "eol",
				highlight_new_as_changed = false,
				highlight_changed_variables = true,
			},
			config = true,
		},
		{
			"leoluz/nvim-dap-go",
			config = true,
			opts = {
				dap_configurations = {
					{ type = "go", name = "Attach remote", mode = "remote", request = "attach" },
				},
				delve = {
					cwd = nil,
					args = {},
					path = "dlv",
					port = "${port}",
					detached = true,
					build_flags = "",
					initialize_timeout_sec = 20,
				},
			},
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			dependencies = {
				{
					"microsoft/vscode-js-debug",
					build = "npm i --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
				},
				{
					"joakker/lua-json5",
					build = "./install.sh",
				},
			},
		},
	},
	keys = {
		{ "<leader>bb", dap_function("toggle_breakpoint") },
		{
			"<leader>bc",
			function()
				if vim.fn.filereadable(".vscode/launch.json") then
					local dap_vscode = require("dap.ext.vscode")
					dap_vscode.load_launchjs(nil, {
						["pwa-node"] = js_based_languages,
						["node"] = js_based_languages,
						["chrome"] = js_based_languages,
						["pwa-chrome"] = js_based_languages,
					})
				end
				require("dap").continue()
			end,
		},
		{ "<C-'>", dap_function("step_over") },
		{ "<C-;>", dap_function("step_into") },
		{ "<C-:>", dap_function("step_out") },
	},
	config = function()
		local dap = require("dap")
		require("dap.ext.vscode").load_launchjs(nil, {})
		local jsDebugAdapter = vim.fn.stdpath("data")
			.. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
		dap.adapters["node-terminal"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { jsDebugAdapter, "${port}" },
			},
		}
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = { jsDebugAdapter, "${port}" },
			},
		}

		dap.configurations.javascript = {
			{
				cwd = "${workspaceFolder}",
				type = "pwa-node",
				name = "Launch file",
				request = "launch",
				program = "${file}",
			},
		}

		-- require("dap-vscode-js").setup({
		-- 	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
		-- 	adapters = {
		-- 		"node",
		-- 		"pwa-node",
		-- 		"pwa-chrome",
		-- 		"pwa-msedge",
		-- 		"node-terminal",
		-- 		"pwa-extensionHost",
		-- 	},
		-- })

		-- for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
		-- dap.configurations[language] = {
		-- 	-- attach to a node process that has been started with
		-- 	-- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
		-- 	-- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
		-- 	{
		-- 		-- use nvim-dap-vscode-js's pwa-node debug adapter
		-- 		type = "pwa-node",
		-- 		-- attach to an already running node process with --inspect flag
		-- 		-- default port: 9222
		-- 		request = "attach",
		-- 		-- allows us to pick the process using a picker
		-- 		processId = require("dap.utils").pick_process,
		-- 		-- name of the debug action you have to select for this config
		-- 		name = "Attach debugger to existing `node --inspect` process",
		-- 		-- for compiled languages like TypeScript or Svelte.js
		-- 		sourceMaps = true,
		-- 		-- resolve source maps in nested locations while ignoring node_modules
		-- 		resolveSourceMapLocations = {
		-- 			"${workspaceFolder}/**",
		-- 			"!**/node_modules/**",
		-- 		},
		-- 		-- path to src in vite based projects (and most other projects as well)
		-- 		cwd = "${workspaceFolder}/src",
		-- 		-- we don't want to debug code inside node_modules, so skip it!
		-- 		skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
		-- 	},
		-- 	{
		-- 		type = "pwa-chrome",
		-- 		name = "Launch Chrome to debug client",
		-- 		request = "launch",
		-- 		url = "http://localhost:5173",
		-- 		sourceMaps = true,
		-- 		protocol = "inspector",
		-- 		port = 9222,
		-- 		webRoot = "${workspaceFolder}/src",
		-- 		-- skip files from vite's hmr
		-- 		skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
		-- 	},
		-- 	--
		-- 	-- only if language is javascript, offer this debug action
		-- 	language == "javascript"
		-- 			and {
		-- 				-- use nvim-dap-vscode-js's pwa-node debug adapter
		-- 				type = "pwa-node",
		-- 				-- launch a new process to attach the debugger to
		-- 				request = "launch",
		-- 				-- name of the debug action you have to select for this config
		-- 				name = "Launch file in new node process",
		-- 				-- launch current file
		-- 				program = "${file}",
		-- 				cwd = "${workspaceFolder}",
		-- 			}
		-- 		or nil,
		-- 	language == "javascript" -- Divider for the launch.json derived configs
		-- 			and {
		-- 				name = "----- ↓ launch.json configs ↓ -----",
		-- 				type = "",
		-- 				request = "launch",
		-- 			}
		-- 		or nil,
		-- }
		-- end

		-- local dlvToolPath = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv"
		-- local goDebugAdapter = vim.fn.stdpath("data")
		-- 	.. "/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js"
		-- dap.adapters.go = {
		-- 	command = "node",
		-- 	type = "executable",
		-- 	args = { goDebugAdapter },
		-- }
		-- dap.configurations.go = {
		-- 	{
		-- 		type = "go",
		-- 		name = "Debug",
		-- 		showLog = true,
		-- 		request = "launch",
		-- 		program = "${file}",
		-- 		dlvToolPath = dlvToolPath, -- Adjust to where delve is installed
		-- 	},
		-- }

		local mason_registry = require("mason-registry")
		local codelldb = mason_registry.get_package("codelldb")

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			host = "127.0.0.1",
			executable = {
				-- CHANGE THIS to your path!
				command = codelldb:get_install_path() .. "/extension/adapter/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}

		local codelldb_options = {
			{
				stopOnEntry = false,
				cwd = "${workspaceFolder}",
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		dap.configurations.c = codelldb_options
		dap.configurations.cpp = codelldb_options
		-- dap.configurations.rust = codelldb_options

		local dapui = require("dapui")

		dapui.setup(dapui_config)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
		end
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
