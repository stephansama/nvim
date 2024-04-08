--- Load snippets from various sources
---@param _ unknown discard
---@param opts table table of options
local load_vsc_snippets = function(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	from_vscode.lazy_load()
	from_vscode.lazy_load({ paths = vim.g.vscode_snippets_path or "" })

	from_snipmate.load()
	from_snipmate.lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	from_lua.load()
	from_lua.lazy_load({ paths = vim.g.lua_snippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
				luasnip.unlink_current()
			end
		end,
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		{
			"hrsh7th/cmp-cmdline",
			event = "VimEnter",
			config = function()
				local cmp = require("cmp")

				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "buffer" } },
				})

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({ { name = "path" } }, {
						{
							name = "cmdline",
							option = { ignore_cmds = { "Man", "!" } },
						},
					}),
				})
			end,
		},
		-- add completion for package.json sort of similar to crates.nvim from rust
		{ "David-Kunz/cmp-npm", ft = "json", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
		{ -- snippet plugin
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = load_vsc_snippets,
		},
		{
			"windwp/nvim-autopairs",
			opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
			config = function(_, opts) -- setup cmp for autopairs
				require("nvim-autopairs").setup(opts)
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},
	},
	config = true,
	opts = function()
		return require("configs.cmp-opts")
	end,
}
