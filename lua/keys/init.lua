local M = {}
local harpoon_utils = require("utils.harpoon")
local execute_neotree = require("utils.neotree").execute_neotree
local spectre_function = require("utils").spectre_function
local harpoon_modify, harpoon_toggle, clear_harpoon, harpoon_select, harpoon_remove =
	harpoon_utils.harpoon_modify,
	harpoon_utils.harpoon_toggle,
	harpoon_utils.clear_harpoon,
	harpoon_utils.harpoon_select,
	harpoon_utils.harpoon_remove

M.harpoon = {
	{ "<leader>R", harpoon_modify("remove"), desc = "Remove current buffer" },
	{ "<leader>a", harpoon_modify("append"), desc = "Append buffer to harpoon" },
	{ "<leader>A", harpoon_modify("prepend"), desc = "Prepend buffer to harpoon" },
	{ "<leader>cp", clear_harpoon, desc = "Clear harpoon" },
	{ "<leader>p", harpoon_toggle, desc = "Open harpoon list" },
	{ "<leader>1", harpoon_select(1), desc = "Switch to Buffer 1" },
	{ "<leader>2", harpoon_select(2), desc = "Switch to Buffer 2" },
	{ "<leader>3", harpoon_select(3), desc = "Switch to Buffer 3" },
	{ "<leader>4", harpoon_select(4), desc = "Switch to Buffer 4" },
	{ "<leader>r1", harpoon_remove(1), desc = "Remove Buffer 1" },
	{ "<leader>r2", harpoon_remove(2), desc = "Remove Buffer 2" },
	{ "<leader>r3", harpoon_remove(3), desc = "Remove Buffer 3" },
	{ "<leader>r4", harpoon_remove(4), desc = "Remove Buffer 4" },
}

M.leetcode = {
	{ "<leader>le", "<cmd>Leet<cr>", desc = "Open leet" },
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

M.dashboard = {
	{
		"<leader>ld",
		function()
			require("utils.dashboard").color_dashboard()
			vim.cmd([[bufdo bd!]])
			vim.cmd([[Dashboard]])
		end,
		desc = "Go to Dashboard",
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
	{ "<C-h>", "<CMD>TmuxNavigateLeft<CR>" },
	{ "<C-j>", "<CMD>TmuxNavigateDown<CR>" },
	{ "<C-k>", "<CMD>TmuxNavigateUp<CR>" },
	{ "<C-l>", "<CMD>TmuxNavigateRight<CR>" },
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

M.noice = {
	{ "<leader>na", "<cmd>NoiceAll<cr>", desc = "Open NoiceAll" },
	{ "<leader>nl", "<cmd>NoiceLast<cr>", desc = "Open NoiceLast" },
	{ "<leader>nt", "<cmd>Telescope noice theme=ivy<cr>", desc = "Open Noice Telescope" },
}

M.neotest = {
	{
		"<leader>rt",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		desc = "Neotest: Run test in current file",
	},
	{
		"<C-\\>",
		function()
			vim.cmd([[Neotest summary]])
		end,
		desc = "Neotest summary",
	},
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

M.oil = { { "-", "<cmd>Oil<CR>", desc = "Open Oil.nvim" } }

M.outline = { { "|", "<CMD>Outline<CR>", desc = "Toggle Outline" } }

M.neocomposer = { { "<leader>mm", "<cmd>EditMacros<CR>", desc = "Edit macros" } }

M.inlay_hints = { { "<leader>th", "<cmd>InlayHintsToggle<cr>", desc = "Toggle inlay hints" } }

M.telescope_nx = { { "<leader>nx", "<cmd>Telescope nx actions theme=ivy<CR>", desc = "nx actions" } }

M.todo_telescope = { { "<leader>tt", "<CMD>TodoTelescope initial_mode=normal<CR>", desc = "Todo Telescope" } }

M.telescope_icon_picker = {
	{ "<leader><leader>i", "<cmd>IconPickerNormal<cr>", desc = "IconPickerNormal" },
	{ "<leader><leader>y", "<cmd>IconPickerYank<cr>", desc = "IconPickerYank" },
}

M.telescope_tmux = {
	{ "<leader>tw", "<cmd>Telescope tmux windows theme=ivy<CR>", desc = "Find tmux windows" },
	{ "<leader>tp", "<cmd>Telescope tmux pane_contents theme=ivy<CR>", desc = "Find tmux pane contents" },
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

return M
