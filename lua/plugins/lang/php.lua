local opts = function()
	return {
		lsp_server = "phpactor",
		user_providers = {},
		ui = require("laravel.options.ui"),
		resources = require("laravel.options.resources"),
		environments = require("laravel.options.environments"),
		user_commands = require("laravel.options.user_commands"),
		commands_options = require("laravel.options.command_options"),
		features = {
			model_info = { enable = true },
			override = { enable = true },
			pickers = { enable = true, provider = "fzf-lua" },
			route_info = { enable = true, view = "right" },
		},
		providers = {
			require("laravel.providers.laravel_provider"),
			require("laravel.providers.repositories_provider"),
			require("laravel.providers.override_provider"),
			require("laravel.providers.completion_provider"),
			require("laravel.providers.route_info_provider"),
			require("laravel.providers.tinker_provider"),
			require("laravel.providers.fzf_lua_provider"),
			require("laravel.providers.ui_select_provider"),
			require("laravel.providers.user_command_provider"),
			require("laravel.providers.status_provider"),
			require("laravel.providers.diagnostics_provider"),
			require("laravel.providers.model_info_provider"),
			require("laravel.providers.composer_info_provider"),
			require("laravel.providers.history_provider"),
		},
	}
end

return {
	{
		"adalessa/laravel.nvim",
		cmd = { "Laravel" },
		config = true,
		filetypes = { "blade", "php" },
		keys = require("keys.init").laravel,
		opts = opts,
		dependencies = {
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
	},
}
