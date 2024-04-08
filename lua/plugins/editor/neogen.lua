local neogen_generate = function()
	require("neogen").generate()
end

return {
	"danymat/neogen",
	config = true,
	event = "BufEnter",
	opts = { enabled = true, snippet_engine = "luasnip" },
	keys = { { "<leader>cg", neogen_generate, desc = "Generate documentation comments" } },
}
