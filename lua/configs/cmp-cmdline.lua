local M = {}

M.config = function()
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

return M
