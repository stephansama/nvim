local M = {}

---@param config_files table<string>
M.config_file_exists = function(config_files)
	local cwd = vim.fn.getcwd()
	local cwd_output = io.popen("ls -a " .. cwd, "r")
	local config_output = io.popen("ls -a " .. cwd .. "/.config", "r")

	if config_output then
		for file in config_output:lines() do
			if vim.tbl_contains(config_files, file) then
				return true
			end
		end
	end

	if cwd_output then
		for file in cwd_output:lines() do
			if vim.tbl_contains(config_files, file) then
				return true
			end
		end
	end

	return false
end

M.use_cspell = function()
	return M.config_file_exists({
		".cspell.json",
		"cspell.json",
		".cSpell.json",
		"cSpell.json",
		"cspell.config.js",
		"cspell.config.cjs",
		"cspell.config.json",
		"cspell.config.yaml",
		"cspell.config.yml",
		"cspell.yaml",
		"cspell.yml",
	})
end

M.ls_process = function(directory, condition, process)
	local ls_output = io.popen("ls " .. directory, "r")

	if ls_output then
		for file in ls_output:lines() do
			local filename = string.match(file, "(.+)%..+")
			if filename and condition(filename) then
				process(filename)
			end
		end
	end
end

return M
