local M = {}

--- create border for highlight group
---@param hl_name string Highlight group name
---@return table<table<string,string>> border_table of border elements
M.border = function(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

if not _G.fzf_pkgjson then
	_G.fzf_pkgjson = true
	vim.api.nvim_create_user_command(
		"FzfPkgJson",
		function()
			-- find all runnable scripts
			local output =
				vim.system({
					"sh",
					"-c",
					"cat package.json | jq '.scripts' | jq 'keys' | jq '.[]' | tr -d '\"' | fzf",
				}):wait()

			local stdout = output.stdout

			if stdout == "" then
				return vim.print("no item selected")
			end

			vim.system({
				"sh",
				"-c",
				string.format(
					"tmux split-window -v '%s'",
					"pnpm run " .. stdout
				),
			})
		end,
		{ nargs = 0 }
	)
end

M.inside_tmux_session = function()
	if vim.fn.exists"$TMUX" == 0 then
		vim.print("Not inside tmux")
		return false
	end
	return true
end

return M
