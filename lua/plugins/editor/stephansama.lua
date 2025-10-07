local keys = require("keys.plugin")

local fzf_tmux_mise_or_make = function()
	if vim.fn.filereadable("mise.toml") == 1 then
		vim.cmd([[FzfTmuxMise]])
	elseif vim.fn.filereadable("Makefile") == 1 then
		vim.cmd([[FzfTmuxMake]])
	else
		vim.notify([[No mise.toml or Makefile found]], vim.log.levels.WARN)
	end
end

vim.api.nvim_create_user_command("FzfTmuxMiseOrMake", fzf_tmux_mise_or_make, {
	nargs = 0,
})

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
}, {
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
