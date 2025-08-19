local M = {}
local pull = require("utils.pull")

M.PLUGINS = pull.pull_plugins_from_languages()

M.SERVERS = pull.merge_flat(pull.pull_property_from_languages("servers"))

M.LINTERS = pull.merge_kv(pull.pull_property_from_languages("linters", pull.kv_rename))

M.FORMATTERS = pull.merge_kv(pull.pull_property_from_languages("formatters", pull.kv_rename))

M.MASON_ENSURE_INSTALLED = pull.merge_flat(pull.pull_property_from_languages("mason"))

M.TREESITTER_ENSURE_INSTALLED = pull.merge_flat(pull.pull_property_from_languages("treesitter"))

M.TREESITTER_PARSERS = pull.merge_kv(pull.pull_property_from_languages("treesitter_parser"))

return M
