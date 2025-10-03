local keys = require("keys.plugin")

vim.api.nvim_create_user_command("FzfTmuxMiseOrMake", function()
	if vim.fn.filereadable("mise.toml") == 1 then
		vim.cmd([[FzfTmuxMise]])
	else
		vim.cmd([[FzfTmuxMake]])
	end
end, { nargs = 0 })

return {
	{
		"stephansama/stow.nvim",
		cmd = "Stow",
		keys = keys.stow,
		config = true,
	},
	{
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
	},
}
