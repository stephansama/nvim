local generate_neogen = function()
	require("neogen").generate()
end

return {
	"danymat/neogen",
	config = true,
	opts = { enabled = true, snippet_engine = "luasnip" },
	keys = {
		{ "<leader>cg", generate_neogen, "Generate documentation comments" },
	},
}
