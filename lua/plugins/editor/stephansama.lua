local keys = require("keys.plugin")

local insert_fzf_nerdfont = function()
	vim.cmd("stopinsert")
	vim.cmd("FzfNerdfont")
end

vim.keymap.set("i", "<C-i>", insert_fzf_nerdfont, {
	noremap = true,
	silent = true,
})

return { {
	"stephansama/fzf-nerdfont.nvim",
	cmd = "FzfNerdfont",
	keys = keys.fzf_nerdfont,
	config = true,
}, {
	"stephansama/stow.nvim",
	cmd = "Stow",
	keys = keys.stow,
	config = true,
}, {
	"stephansama/fzf-tmux-runner.nvim",
	config = true,
	keys = keys.fzf_tmux_runner,
	cmd = {
		"FzfTmuxMiseOrMake",
		"FzfTmuxMise",
		"FzfTmuxMake",
		"FzfTmuxPackageJson",
	},
	---@module "fzf-tmux-runner"
	---@type FzfTmuxRunnerOpts
	opts = {
		package_manager = "nr",
		direction = "horizontal",
		interactive = true,
	},
} }
