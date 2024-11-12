local M = {}
local harpoon_utils = require("utils.harpoon_utils")
local execute_neotree = require("utils.neotree").execute_neotree
local spectre_function = require("utils").spectre_function
local harpoon_modify, harpoon_toggle, clear_harpoon, harpoon_select, harpoon_remove =
	harpoon_utils.harpoon_modify,
	harpoon_utils.harpoon_toggle,
	harpoon_utils.clear_harpoon,
	harpoon_utils.harpoon_select,
	harpoon_utils.harpoon_remove

M.LEADER = " "

M.dashboard = { { "<leader>ld", require("utils.dashboard").go_to_dashboard, desc = "Go to Dashboard" } }

M.dashboard_actions = {
	{ "", "f", "Find  file", "Telescope find_files" },
	{ "", "r", "Find  recent", "Telescope oldfiles" },
	{ "", "w", "Find  words", "Telescope live_grep" },
	{ "󰌌", "k", "Find  keymaps", "Telescope keymaps" },
	{ "󰑴", "l", "Open leetcode", "Leet" },
	{ "", "q", "Quit", "qa" },
}

M.dbui = {
	{ "<leader>od", vim.cmd.DBUIToggle, desc = "Open Database UI" },
}

M.harpoon = {
	{ "<leader>R", harpoon_modify("remove"), desc = "Remove current buffer from harpoon" },
	{ "<leader>a", harpoon_modify("append"), desc = "Append buffer to harpoon" },
	{ "<leader>A", harpoon_modify("prepend"), desc = "Prepend buffer to harpoon" },
	{ "<leader>p", harpoon_toggle, desc = "Open harpoon list" },
	{ "<leader>cp", clear_harpoon, desc = "Clear harpoon" },
	{ "<leader>1", harpoon_select(1), desc = "Switch to Harpoon Buffer 1" },
	{ "<leader>2", harpoon_select(2), desc = "Switch to Harpoon Buffer 2" },
	{ "<leader>3", harpoon_select(3), desc = "Switch to Harpoon Buffer 3" },
	{ "<leader>4", harpoon_select(4), desc = "Switch to Harpoon Buffer 4" },
	{ "<leader>r1", harpoon_remove(1), desc = "Remove Harpoon Buffer 1" },
	{ "<leader>r2", harpoon_remove(2), desc = "Remove Harpoon Buffer 2" },
	{ "<leader>r3", harpoon_remove(3), desc = "Remove Harpoon Buffer 3" },
	{ "<leader>r4", harpoon_remove(4), desc = "Remove Harpoon Buffer 4" },
}

M.leetcode = {
	{ "<leader>le", vim.cmd.Leet, desc = "Open leet" },
	{ "<leader>lr", "<cmd>Leet run<cr>", desc = "Run leet" },
	{ "<leader>lp", "<cmd>Leet open<cr>", desc = "Open leet url" },
	{ "<leader>lc", "<cmd>Leet lang<cr>", desc = "Open leet language picker" },
	{ "<leader>li", "<cmd>Leet info<cr>", desc = "Get info for leet question" },
	{
		"<leader>lh",
		function()
			require("utils").openURL(require("constants.url").LEETCODE_URL)
		end,
		desc = "Get info for leet question",
	},
}

M.rest = {
	{ "<leader>rr", "<cmd>Rest run<CR>", desc = "Run rest command under cursor" },
	{ "<leader>rl", "<cmd>Rest last<CR>", desc = "Rerun last rest command" },
	{ "<leader>re", "<cmd>Rest env select_env<CR>", desc = "Select environment variable for rest" },
}

M.trouble = {
	{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
	{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
	{ "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions (Trouble)" },
}

M.treesitter_context = {
	{ "<leader>tc", vim.cmd.TSContextToggle, desc = "Toggle treesitter context" },
	{
		"[c",
		function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end,
		silent = true,
		desc = "Go to treesitter context",
	},
}

M.treesitter_incremental_selection = {
	init_selection = "<leader>ss",
	node_incremental = "<leader>si",
	node_decremental = "<leader>sd",
	scope_incremental = "<leader>sc",
}

M.cmp = {
	NEXT = "<C-n>",
	PREV = "<C-p>",
	CLOSE = "<C-e>",
	SELECT = "<CR>",
	COMPLETE = "<C-y>",
	NEXT_OR_SNIPPET = "<Tab>",
	PREV_OR_SNIPPET = "<S-Tab>",
	SCROLL_DOCS_BACKWARD = "<C-d>",
	SCROLL_DOCS_FORWARD = "<C-f>",
}

M.mason = {
	uninstall_server = "X",
	install_server = "i",
	update_server = "u",
	update_all_servers = "U",
	check_server_version = "c",
	check_outdated_servers = "C",
	cancel_installation = "<C-c>",
	toggle_server_expand = "<CR>",
}

M.tmux = {
	{ "<C-h>", vim.cmd.TmuxNavigateLeft },
	{ "<C-j>", vim.cmd.TmuxNavigateDown },
	{ "<C-k>", vim.cmd.TmuxNavigateUp },
	{ "<C-l>", vim.cmd.TmuxNavigateRight },
}

M.spectre = {
	{ "<leader>S", spectre_function("toggle"), desc = "Toggle spectre" },
	{ "<leader>sw", spectre_function("open_visual"), desc = "Search current word" },
	{ "<leader>sf", spectre_function("open_file_search"), desc = "Search current file" },
}

M.crates = {
	{ "<leader>cs", "<cmd>Crates show_popup<cr>", desc = "Crates.nvim open features list" },
	{ "<leader>cu", "<cmd>Crates update_crate<cr>", desc = "Crates.nvim update crate" },
	{ "<leader>cu", "<cmd>Crates update_crates<cr>", desc = "Crates.nvim update crates", mode = "v" },
	{ "<leader>ch", "<cmd>Crates open_homepage<cr>", desc = "Crates.nvim open homepage" },
	{ "<leader>cc", "<cmd>Crates open_cratesio<cr>", desc = "Crates.nvim open crates.io" },
	{ "<leader>cr", "<cmd>Crates open_repository<cr>", desc = "Crates.nvim open repository" },
	{ "<leader>cd", "<cmd>Crates open_documentation<cr>", desc = "Crates.nvim open docs.rs" },
	{ "<leader>cf", "<cmd>Crates show_features_popup<cr>", desc = "Crates.nvim open features list" },
	{ "<leader>ce", "<cmd>Crates show_dependencies_popup<cr>", desc = "Crates.nvim open dependencies list" },
}

M.key_analyzer = {
	{ "<leader>ka", ":KeyAnalyzer ", desc = "Key Analyzer" },
	{ "<leader>kc", ":KeyAnalyzer <C-<CR>", desc = "Key Analyzer for ctrl" },
	{
		"<leader>kl",
		function()
			vim.cmd([[KeyAnalyzer <leader>]])
		end,
		desc = "Key Analyzer for leader",
	},
}

M.notify = { { "<leader>nt", "<cmd>Telescope notify theme=ivy<cr>", desc = "Open Notify Telescope" } }

M.noice = {
	{ "<leader>na", vim.cmd.NoiceAll, desc = "Open NoiceAll" },
	{ "<leader>nl", vim.cmd.NoiceLast, desc = "Open NoiceLast" },
}

M.neotest = {
	{
		"<leader>rt",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		desc = "Neotest: Run test in current file",
	},
	{ "<C-\\>", "<cmd>Neotest summary<CR>", desc = "Neotest summary" },
	{ "<leader>ro", "<cmd>Neotest output<CR>", desc = "Open Neotest output" },
	{ "<leader>rp", "<cmd>Neotest output-panel<CR>", desc = "Open Neotest output-panel" },
}

M.neogen = {
	{
		"<leader>cg",
		function()
			require("neogen").generate()
		end,
		desc = "Generate documentation comments",
	},
}

M.neo_tree = {
	{ "\\", execute_neotree(), desc = "Open explorer side panel" },
	{ "g\\", execute_neotree({ source = "git_status" }), desc = "Open explorer side panel" },
}

M.gh_navigator = {
	{ "<leader>gh", "<cmd>GH repo<CR>", desc = "Open github repo" },
	{ "<leader>gb", "<cmd>GH browse<CR>", desc = "Open github file in blob view" },
	{ "<leader>gP", "<cmd>GH repo pulls<CR>", desc = "Open github repo pull requests" },
}

M.oil = { { "-", vim.cmd.Oil, desc = "Open Oil.nvim" } }

M.outline = { { "|", vim.cmd.Outline, desc = "Toggle Outline" } }

M.quicker = { { "<leader>q", "<cmd>lua require('quicker').toggle()<CR>", desc = "Toggle quickfixlist" } }

M.urlview = { { "<leader>gx", vim.cmd.UrlView, desc = "Open urlview" } }

M.maximizer = { { "<leader>sm", vim.cmd.MaximizerToggle, desc = "Toggle maximizer on a split" } }

M.liveserver = { { "<leader>ls", vim.cmd.LiveServerToggle, desc = "Toggle live server" } }

M.table_mode = { { "<leader>mt", vim.cmd.TableModeToggle, desc = "Toggle markdown table mode" } }

M.neocomposer = { { "<leader>mm", vim.cmd.EditMacros, desc = "Edit macros" } }

M.startuptime = { { "<leader>st", vim.cmd.StartupTime, desc = "Debug neovim StartupTime" } }

M.inlay_hints = { { "<leader>th", vim.cmd.InlayHintsToggle, desc = "Toggle inlay hints" } }

M.telescope_nx = { { "<leader>nx", "<cmd>Telescope nx actions theme=ivy<CR>", desc = "nx actions" } }

M.todo_telescope = { { "<leader>tt", "<CMD>TodoTelescope initial_mode=normal<CR>", desc = "Todo Telescope" } }

M.markdownpreview = { { "<leader>mp", vim.cmd.MarkdownPreview, desc = "Enable markdown preview" } }

M.telescope_icon_picker = {
	{ "<leader><leader>i", vim.cmd.IconPickerNormal, desc = "IconPickerNormal" },
	{ "<leader><leader>y", vim.cmd.IconPickerYank, desc = "IconPickerYank" },
}

M.telescope_tmux = {
	{ "<leader>tw", "<cmd>Telescope tmux windows theme=ivy<CR>", desc = "Find tmux windows" },
	{ "<leader>ts", "<cmd>Telescope tmux sessions initial_mode=normal theme=ivy<CR>", desc = "Find tmux sessions" },
}

M.telescope = {
	{ "<leader><Tab>", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
	{ "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find symbols" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
	{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Find word" },
	{ "<leader>fe", "<cmd>Telescope grep_string<CR>", desc = "Find exact word" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find oldfiles" },
	{ "<leader>ft", "<cmd>Telescope colorscheme<CR>", desc = "Change colorscheme" },
	{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Find marks" },
	{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Find within git status" },
	{ "<leader>go", "<cmd>Telescope git_file_history theme=ivy initial_mode=normal<CR>", desc = "Find exact word" },
	{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find within current buffer" },
}

M.telescope_qflist = "<C-q>"

return M
