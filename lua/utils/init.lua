local M = {}

--- launch url dependent on system
---@param url string
---@return nil
M.openURL = function(url)
	if url == "" then
		return
	end
	vim.cmd("exec \"!open '" .. url .. "'\"")
end

--- create border for highlight group
---@param hl_name string Highlight group name
---@return table border_table of border elements
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

---Capture extension from filename
---@param filepath string
---@return string
M.capture_after_first_period_in_filename = function(filepath)
	-- Extract the filename from the full path using patterns
	local filename = filepath:match("([^/]+)$")
	-- Apply the previous function to capture content after the first period in the filename
	local after_period = string.match(filename, "%.(.+)")
	return after_period or filename or ""
end

return M
