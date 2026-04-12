local lang = require("lang")
local constants = require("config.constants")
local keymaps = require("keys.plugin")
local TREESITTER_PARSER_INSTALL_DIR = constants.TREESITTER_PARSER_INSTALL_DIR

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1",
	},
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = "v3.x",
	},
	{ src = "https://github.com/kevinhwang91/nvim-bqf" },
	{ src = "https://github.com/stevearc/quicker.nvim" },
	{
		src = "https://github.com/kylechui/nvim-surround",
		version = vim.version.range("4.x"),
	},
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/luukvbaal/statuscol.nvim" },
	{ src = "https://github.com/hedyhli/outline.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/RRethy/vim-illuminate" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
	{ src = "https://github.com/MysticalDevil/inlay-hints.nvim" },
	{ src = "https://github.com/axieax/urlview.nvim" },
	{ src = "https://github.com/jake-stewart/multicursor.nvim" },
})

local fzf_lua = require("fzf-lua")
local actions = fzf_lua.actions
fzf_lua.setup({
	"default-title",
	winopts = {
		preview = {
			layout = "flex",
			flip_columns = 600,
		},
	},
	keymap = {
		fzf = {
			["alt-s"] = "select-all+accept",
			["alt-q"] = "select+accept",
		},
	},
	files = {
		cwd_prompt = false,
		actions = {
			["alt-i"] = { actions.toggle_ignore },
			["alt-h"] = { actions.toggle_hidden },
		},
	},
	grep = {
		actions = {
			["alt-i"] = { actions.toggle_ignore },
			["alt-h"] = { actions.toggle_hidden },
		},
	},
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<C-e>"] = { "hide", "show" },
	},
	appearance = { nerd_font_variant = "mono" },
	cmdline = {
		completion = {
			menu = { auto_show = true },
		},
	},
	completion = {
		accept = {
			auto_brackets = { enabled = false },
		},
		menu = { border = "rounded" },
	},
	signature = {
		window = { border = "rounded" },
	},
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		---@see BlinkDocumentation https://cmp.saghen.dev/recipes.html#deprioritize-specific-lsp
		sorts = { "exact", function(a, b)
			if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then return end
			return b.client_name == "emmet_ls"
		end, "score", "sort_text" },
	},
})

require("nvim-autopairs").setup({
	fast_wrap = {},
	disable_filetype = { "vim" },
})

local function luasnip_config(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	from_vscode.lazy_load({
		paths = { require("config.constants").SNIPPETS_DIR },
	})

	local vscode_folder = vim.fn.getcwd() .. "/.vscode/"

	if vim.fn.isdirectory(vscode_folder) == 1 then
		local dir = vim.fn.readdir(vscode_folder)
		if #dir > 0 then
			for _, filename in ipairs(dir) do
				if filename:match("%.code%-snippets$") then
					from_vscode.load_standalone({
						path = vscode_folder .. filename,
					})
				end
			end
		end
	end

	from_snipmate.load()
	from_snipmate.lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	from_lua.load()
	from_lua.lazy_load({ paths = vim.g.lua_snippets_path or "" })

	local callback = function()
		if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
			luasnip.unlink_current()
		end
	end

	vim.api.nvim_create_autocmd("InsertLeave", { callback = callback })
end

luasnip_config(_, {
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

require("nvim-web-devicons").setup(require("icons.devicons"))
require("nvim-highlight-colors").setup({})
require("bqf").setup()
require("quicker").setup()
require("inlay-hints").setup()
require("outline").setup({})
require("urlview").setup({
	default_picker = "fzf_lua",
	default_action = "system",
})

local statuscol_builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	segments = { {
		text = { statuscol_builtin.foldfunc },
		click = "v:lua.ScFa",
	}, {
		text = { "%s" },
		click = "v:lua.ScSa",
	}, {
		text = { statuscol_builtin.lnumfunc, " " },
		click = "v:lua.ScLa",
	} },
})

require("neo-tree").setup({
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	close_if_last_window = true,
	icon = require("icons.neotree").icon,
	name = {
		trailing_slash = false,
		use_git_status_colors = true,
		highlight = "NeoTreeFileName",
	},
	type = {
		enabled = true,
		required_width = 122,
	},
	window = {
		mappings = {
			P = {
				"toggle_preview",
				config = {
					use_float = false,
					use_image_nvim = true,
				},
			},
			["<ESC>"] = "",
		},
	},
	buffers = {
		follow_current_file = { enabled = true },
	},
	created = {
		enabled = true,
		required_width = 110,
	},
	file_size = {
		enabled = true,
		required_width = 64,
	},
	git_status = { symbols = require("icons.neotree").symbols },
	last_modified = {
		enabled = true,
		required_width = 88,
	},
	symlink_target = { enabled = false },
	filesystem = {
		window = {
			mappings = {
				["/"] = "",
				f = "fuzzy_finder",
			},
		},
		follow_current_file = { enabled = true },
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
		components = { icon = require("utils.neotree").load_neo_tree_icons },
	},
	event_handlers = { {
		event = "file_opened",
		handler = function()
			require("neo-tree.command").execute({ action = "close" })
		end,
	} },
})

table.insert(lang.MASON_REGISTRIES, "github:mason-org/mason-registry")

local function MasonInstallAll()
	if lang.MASON and #lang.MASON > 0 then
		vim.cmd("MasonInstall " .. table.concat(lang.MASON, " "))
	end
end

vim.api.nvim_create_user_command("MasonInstallAll", MasonInstallAll, {})

require("mason").setup({
	PATH = "prepend",
	registries = lang.MASON_REGISTRIES,
	ensure_installed = lang.MASON,
	ui = {
		icons = require("icons.init").mason,
		border = "rounded",
		keymaps = keymaps.mason,
	},
})

local function append_stop_flag(tbl)
	for _, fmt_list in pairs(tbl) do
		fmt_list.stop_after_first = true
	end
	return tbl
end

require("conform").setup({
	formatters_by_ft = append_stop_flag(lang.FORMATTERS),
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
	formatters = {
		prettier = {
			require_cwd = true,
			cwd = require(
				"conform.util"
			).root_file(constants.PRETTIER_ROOT_CONFIG),
		},
		oxfmt = { command = "./node_modules/.bin/oxfmt" },
	},
})

local treesitter = require("nvim-treesitter")
treesitter.setup({
	highlight = { enable = true },
	auto_install = false,
	sync_install = false,
	ensure_installed = lang.TREESITTER,
	parser_install_dir = TREESITTER_PARSER_INSTALL_DIR,
	incremental_selection = { enable = true },
})
treesitter.install(lang.TREESITTER)

vim.api.nvim_create_autocmd("FileType", { callback = function(args)
	pcall(vim.treesitter.start, args.buf)
end })

require("utils.lspconfig")
require("nvim-highlight-colors").turnOn()
require("ufo").setup({
	preview = {
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
	},
})

local function use_cspell(config_files)
	local cwd = vim.fn.getcwd()

	for _, file in ipairs(config_files) do
		if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
			return true
		end
		if vim.fn.filereadable(cwd .. "/.config/" .. file) == 1 then
			return true
		end
	end

	return false
end

_G.cspell_enabled =
	use_cspell({
		".cSpell.json",
		".cspell.json",
		"cSpell.json",
		"cspell.config.cjs",
		"cspell.config.js",
		"cspell.config.json",
		"cspell.config.yaml",
		"cspell.config.yml",
		"cspell.json",
		"cspell.yaml",
		"cspell.yml",
	})

local function lint_file()
	local lint = require("lint")
	lint.try_lint()
	if _G.cspell_enabled then
		lint.try_lint("cspell")
	end
end

require("lint").linters_by_ft = require("lang").LINTERS

vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = lint_file })

local mc = require("multicursor-nvim")
mc.setup()

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
vim.keymap.set("n", "<c-leftdrag>", mc.handleMouseDrag)
vim.keymap.set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Disable and enable cursors.
vim.keymap.set({ "n", "x" }, "<c-q>", mc.toggleCursor)

mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "<left>", mc.prevCursor)
	layerSet({ "n", "x" }, "<right>", mc.nextCursor)

	-- Delete the main cursor.
	layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
