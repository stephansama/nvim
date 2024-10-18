return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	opts = { history = true, updateevents = "TextChanged,TextChangedI" },
	config = require("utils").load_snippets,
}
