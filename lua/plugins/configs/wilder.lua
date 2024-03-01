local wilder = require("wilder")

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(vim.tbl_deep_extend(
		"force",
		wilder.popupmenu_palette_theme({
			border = "rounded",
			max_height = "75%",
			min_height = "75%",
			prompt_position = "top",
			reverse = 0,
		}),
		{
			highlighter = {
				wilder.lua_fzy_highlighter(),
			},
			highlights = {
				accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
			},
		}
	))
)

wilder.setup({ modes = { ":" }, enable_cmdline_enter = 0 })
