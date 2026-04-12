require("config")

_G.start_time = vim.uv.hrtime()

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		-- Options related to the message module.
		---@type 'cmd'|'msg' Default message target, either in the
		---cmdline or in a separate ephemeral message window.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds and triggers to a target.
		targets = "cmd",
		cmd = { -- Options related to messages in the cmdline window.
		height = 0.5 }, -- Maximum height while expanded for messages beyond 'cmdheight'.
		dialog = { -- Options related to dialog window.
		height = 0.5 }, -- Maximum height.
		msg = {
			height = 0.5, -- Maximum height.
			timeout = 4000, -- Time a message is visible in the message window.
		},
		pager = { height = 0.5 }, -- Maximum height.
	},
})
