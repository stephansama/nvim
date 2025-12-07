local constants = require("config.constants")

local function append_stop_flag(tbl)
	for _, fmt_list in pairs(tbl) do
		fmt_list.stop_after_first = true
	end
	return tbl
end

local formatters = append_stop_flag(require("plugins.lang").FORMATTERS)

return {
	"stevearc/conform.nvim",
	config = true,
	event = "BufWritePre",
	opts = {
		formatters_by_ft = formatters,
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
		formatters = {
			prettier = {
				cwd = constants.PRETTIER_ROOT_CONFIG,
				require_cwd = true,
			},
		},
	},
}
