local M = {}

--- find prettier in cwd or use other formatter
---@param other_formatter table<string>
M.prettier_formatter_or = function(other_formatter)
	local cwd = vim.fn.getcwd()
	local ls_output = io.popen("ls -a " .. cwd, "r")
	local prettierExists = false
	local prettierConfigFiles = {
		".prettierrc",
		".prettier.json",
		".prettier.json5",
		".prettier.yaml",
		".prettier.yml",
		".prettierrc.js",
		".prettierrc.mjs",
		".prettierrc.toml",
		"prettier.config.js",
		"prettier.config.mjs",
	}
	if ls_output then
		for file in ls_output:lines() do
			prettierExists = prettierExists or vim.tbl_contains(prettierConfigFiles, file)
		end
	end
	if prettierExists then
		return { "prettier" }
	else
		return other_formatter
	end
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

M.kv_rename = function(t, name)
	if type(t) == "string" then
		return { [name] = { t } }
	end
	return t
end

M.flat_rename = function(t, _)
	if type(t) ~= "table" then
		return { t }
	end
	return t
end

--- convert lua lists to key value pair
---@param list table<string>|table<string,table<string>>
---@return table<string,table<string>|table<table<string>>>
M.merge_kv = function(list)
	local merged = {}
	for _, v in pairs(list) do
		for key, value in pairs(v) do
			merged[key] = value
		end
	end
	return merged
end

--- convert lua list into a flat list
---@param list table<string>|table<string,table<string>>
---@return table<string>
M.merge_flat = function(list)
	local merged = {}
	for _, v in pairs(list) do
		if type(v) == "string" then
			table.insert(merged, v)
		else
			for _, c in pairs(v) do
				table.insert(merged, c)
			end
		end
	end
	return merged
end

M.pull_telescope_extensions_from_languages = function(orig, callback)
	local ENABLED = require("constants.languages")
	local languages = require("constants.languagepacks")
	local collected = orig
	callback = type(callback) == "function" and callback or M.flat_rename

	for _, value in ipairs(ENABLED) do
		local telescope_extensions = languages[value]["telescope_extensions"]
		if telescope_extensions then
			collected[#collected + 1] = callback(languages[value]["telescope_extensions"], value)
		end
	end

	return M.merge_flat(collected)
end

--- pull plugins from lang directory
---@return table<string>
M.pull_plugins_from_languages = function()
	local list = require("constants.plugins")
	local languages = require("constants.languages")

	M.ls_process(require("constants.dir").PLUGIN_LANG_DIR, function(filename)
		return vim.tbl_contains(languages, filename)
	end, function(filename)
		list[#list + 1] = "lang." .. filename
	end)

	return list
end

---@see LanguageObject
---@param property 'servers'|'linters'|'formatters'|'treesitter'|'mason'|'mason_lsp'
---@param callback function | nil
---@return table
M.pull_property_from_languages = function(property, callback)
	local ENABLED = require("constants.languages")
	local languages = require("constants.languagepacks")
	local collected = {}
	callback = type(callback) == "function" and callback or M.flat_rename
	for _, value in ipairs(ENABLED) do
		collected[value] = callback(languages[value][property], value)
	end

	return collected
end

return M
