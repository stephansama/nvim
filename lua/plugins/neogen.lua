local expand_keymaps = require("utils").expand_keymaps

local opts = { enabled = true, snippet_engine = "luasnip" }

local init = function()
	expand_keymaps({
		n = {
			["<leader>cg"] = {
				":lua require('neogen').generate()<CR>",
				"Generate documentation comments",
			},
		},
	})
end

return {
	"danymat/neogen",
	init = init,
	opts = opts,
	config = true,
}
