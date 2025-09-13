--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--- write to home directory the last known position of neovim before quitting
--- (useful for when changing directory within neovim)
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("SaveCWDOnExit", { clear = true }),
	desc = "Write last known working directory to file on exit",
	callback = function()
		local cwd = vim.fn.getcwd()
		vim.fn.writefile({ cwd }, vim.fn.expand("~/.nvim_cwd"))
	end,
})

--- underline found links
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("HighlightLinks", { clear = true }),
	pattern = "*",
	command = [[match Underlined /https\?:\/\/\S\+/]],
})

local function reset_ui()
	if package.preload["ufo"] then
		vim.cmd([[UfoEnableFold]])
	end

	vim.cmd([[hi FloatBorder guifg=White guibg=none]])
	vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	vim.cmd([[hi MiniIndentscopeSymbol guifg=#C93638 guibg=none]])
	vim.cmd([[hi NoiceCmdlinePopupBorder guifg=#C93638 guibg=none]])
	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd(
		[[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
	)

	if package.preload["dashboard"] then
		vim.cmd([[ColorDashboard]])
	end
end

vim.api.nvim_create_user_command("ResetUI", reset_ui, { nargs = 0 })

local function cd_fzf(script, base)
	local output = vim.system({ "sh", "-c", script .. " | fzf --tmux" }):wait()
	local stdout = output.stdout
	if not stdout or #stdout < 1 then return end
	local dir = base .. "/" .. stdout:sub(1, #stdout - 1)
	vim.api.nvim_set_current_dir(dir)
	vim.cmd([[GoToDashboard]])
end

vim.api.nvim_create_user_command(
	"FzfProject",
	function()
		cd_fzf(
			'find "$CODE" -type d -mindepth 1 -maxdepth 1 | sed "s@$CODE/@@g"',
			os.getenv("CODE")
		)
	end,
	{ nargs = 0 }
)

vim.api.nvim_create_user_command(
	"FzfGitSubmodules",
	function()
		cd_fzf("git submodule --quiet foreach 'echo $path'", vim.fn.getcwd())
	end,
	{ nargs = 0 }
)

local function get_top_level()
	return vim.fn.systemlist("git rev-parse --show-toplevel")[1]
end

local function go_to_git_root()
	local current = vim.fn.getcwd()

	-- Try to cd into the git toplevel
	local toplevel = get_top_level()
	if not toplevel or toplevel == "" then
		vim.notify("Not inside a Git repo", vim.log.levels.WARN)
		return
	end

	vim.fn.chdir(toplevel)

	-- If still in the same directory, go up one and try again
	if vim.fn.getcwd() == current then
		vim.fn.chdir("..")
		toplevel = get_top_level()
		if toplevel and toplevel ~= "" then
			vim.fn.chdir(toplevel)
			vim.cmd([[GoToDashboard]])
		end
	end
end

vim.api.nvim_create_user_command("GoToGitRoot", go_to_git_root, { nargs = 0 })

local function go_to_dotfiles()
	local dir = os.getenv("DOTFILES")
	if dir then
		vim.fn.chdir(dir)
		vim.cmd([[GoToDashboard]])
	else
		local reason = "($DOTFILES env not set)"
		vim.notify("failed to change directory to dotfiles " .. reason)
	end
end

vim.api.nvim_create_user_command("GoToDotfiles", go_to_dotfiles, { nargs = 0 })
