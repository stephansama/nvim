local keys = require("keys.plugin")

vim.api.nvim_create_user_command(
	"FzfTmuxMiseOrMake",
	function()
		if vim.fn.filereadable("mise.toml") == 1 then
			vim.cmd([[FzfTmuxMise]])
		elseif vim.fn.filereadable("Makefile") == 1 then
			vim.cmd([[FzfTmuxMake]])
		else
			vim.notify([[No mise.toml or Makefile found]], vim.log.levels.WARN)
		end
	end,
	{ nargs = 0 }
)

return { {
	"stephansama/stow.nvim",
	cmd = "Stow",
	keys = keys.stow,
	config = true,
}, {
	"stephansama/fzf-tmux-runner.nvim",
	cmd = { "FzfTmuxMake", "FzfTmuxMise", "FzfTmuxPackageJson" },
	keys = keys.fzf_tmux_runner,
	config = true,
	---@module "fzf-tmux-runner"
	---@type FzfTmuxRunnerOpts
	opts = {
		package_manager = "nr",
		direction = "horizontal",
		interactive = true,
	},
} }
