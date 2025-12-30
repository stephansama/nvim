local keys = require("keys.plugin")

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
