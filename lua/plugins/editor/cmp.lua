local cmdline_config = function()
	local cmp = require("cmp")
	local mapping = cmp.mapping.preset.cmdline()

	cmp.setup.cmdline("/", { mapping = mapping, sources = { { name = "buffer" } } })

	cmp.setup.cmdline(":", {
		mapping = mapping,
		sources = cmp.config.sources({ { name = "path" } }, {
			{
				name = "cmdline",
				option = { ignore_cmds = { "Man", "!" } },
			},
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	config = true,
	event = "InsertEnter",
	opts = function()
		return require("configs.cmp-opts")
	end,
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
			event = { "InsertEnter", "CmdlineEnter" },
			config = cmdline_config,
		},
		-- add completion for package.json sort of similar to crates.nvim from rust
		{ "David-Kunz/cmp-npm", ft = "json", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
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
}
