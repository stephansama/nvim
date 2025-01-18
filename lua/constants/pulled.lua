local M = {}
local pull = require("utils.pull")
local kv_rename, merge_flat, merge_kv, pull_property_from_languages, pull_plugins_from_languages, pull_telescope_extensions_from_languages =
	pull.kv_rename,
	pull.merge_flat,
	pull.merge_kv,
	pull.pull_property_from_languages,
	pull.pull_plugins_from_languages,
	pull.pull_telescope_extensions_from_languages

M.TELESCOPE_EXTENSIONS = pull_telescope_extensions_from_languages({
	"git_file_history",
})

M.PLUGINS = pull_plugins_from_languages()

M.SERVERS = merge_flat(pull_property_from_languages("servers"))

M.LINTERS = merge_kv(pull_property_from_languages("linters", kv_rename))

M.FORMATTERS = merge_kv(pull_property_from_languages("formatters", kv_rename))

M.MASON_ENSURE_INSTALLED = merge_flat(pull_property_from_languages("mason"))

M.MASON_LSP_ENSURE_INSTALLED = merge_flat(pull_property_from_languages("mason_lsp"))

M.TREESITTER_ENSURE_INSTALLED = merge_flat(pull_property_from_languages("treesitter"))

return M
