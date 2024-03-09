local wilder = require("wilder")

local accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } })

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(vim.tbl_deep_extend(
		"force",
		wilder.popupmenu_palette_theme({
			border = "single",
			margin = "15%",
			reverse = 0,
			min_height = 0,
			max_height = "25%",
			prompt_position = "top",
		}),
		{
			highlighter = { wilder.lua_fzy_highlighter() },
			highlights = { accent = accent },
		}
	))
)

wilder.setup({ modes = { ":", "/" } })
