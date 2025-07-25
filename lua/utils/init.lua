local M = {}

--- escape patterns for lua regex
---@param s string
---@return string
---@return number
M.escape_pattern = function(s)
	return s:gsub("([^%w])", "%%%1")
end

---@see BlinkDocumentation https://cmp.saghen.dev/recipes.html#deprioritize-specific-lsp
M.depriotize_emmet = function(a, b)
	if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
		return
	end
	return b.client_name == "emmet_ls"
end

---@param fzf_script string
---@param base string
M.cd_fzf = function(fzf_script, base)
	local output = vim.system({ "sh", "-c", fzf_script }):wait()
	local stdout = output.stdout
	if not stdout or #stdout < 1 then
		return
	end
	require("utils.dashboard").go_to_dashboard()
	local dir = base .. "/" .. stdout:sub(1, #stdout - 1)
	vim.api.nvim_set_current_dir(dir)
end

---@param fzf_script string
---@param base string
M.cd_fzf_keymap = function(fzf_script, base)
	return function()
		M.cd_fzf(fzf_script, base)
	end
end

---move buffer in a specific direction
---@param direction 'next' | 'previous'
---@return function
M.move_buffer = function(direction)
	local directions = { previous = vim.cmd.bprevious, next = vim.cmd.bnext }
	return function()
		directions[direction]()
		print(direction:gsub("^%l", string.upper) .. " Buffer")
	end
end

--- Deletes buffer and alerts the user
M.delete_buffer = function()
	vim.cmd.bd()
	print("Deleting buffer...")
end

--- install telescope extension
---@param extensions table
---@return function
M.configure_telescope = function(extensions)
	return function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		for _, extension in pairs(extensions) do
			telescope.load_extension(extension)
		end
	end
end

M.is_version = function(version)
	local major, minor, patch = version:match("^(%d+)%.(%d+)%.(%d+)$")

	major = tonumber(major)
	minor = tonumber(minor) or 1
	patch = tonumber(patch) or 1

	return major and minor and patch
end

--- determine if a package.json key is a package
---@param text string
M.is_package = function(text)
	--- @type string | nil
	local key = string.match(text, '"([^"]+)"%s*:')
	local key_exclude_list = { "node", "version" }

	if vim.tbl_contains(key_exclude_list, key) then
		return false
	end

	--- @type string | nil
	local value = string.match(text, ':%s*"([^"]+)"')

	if not value then
		return false
	end

	local prefixes = { "beta", "canary", "catalog:", "latest", "next", "patches/" }

	for _, val in ipairs(prefixes) do
		if string.sub(text, 1, #val) == val then
			return true
		end
	end

	local special_chars = { "^", "*", ".x", "~", ">", ">=", "<=", "<" }
	for _, val in ipairs(special_chars) do
		local escaped = M.escape_pattern(val)
		value = value:gsub(escaped, "")
	end

	return M.is_version(value)
end

--- launch url dependent on system
---@param url string
---@return nil
M.openURL = function(url)
	if url == "" then
		return
	end
	vim.cmd("exec \"!open '" .. url .. "'\"")
end

---@param function_name "toggle" | "open_visual" | "open_file_search" name of function to invoke from spectre
---@return function keymap function used to invoke spectre
M.spectre_function = function(function_name)
	return function()
		local params = function_name ~= "toggle" and { select_word = true } or {}
		require("spectre")[function_name](params)
	end
end

return M
