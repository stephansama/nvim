local M = {}

--- escape patterns for lua regex
---@param s string
---@return string
---@return number
M.escape_pattern = function(s)
	return s:gsub("([^%w])", "%%%1")
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

	local prefixes =
		{ "beta", "canary", "catalog:", "latest", "next", "patches/" }

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

return M
