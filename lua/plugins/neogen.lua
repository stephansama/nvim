local expand_keymaps = require("utils").expand_keymaps

local generate_neogen = function()
	require("neogen").generate()
end

return {
	"danymat/neogen",
	config = true,
	opts = { enabled = true, snippet_engine = "luasnip" },
	init = function()
		expand_keymaps({
			n = {
				["<leader>cg"] = { generate_neogen, "Generate documentation comments" },
			},
		})
	end,
}
