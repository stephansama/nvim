local M = {}

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

M.merge_kv = function(list)
	local merged = {}
	for _, v in pairs(list) do
		for key, value in pairs(v) do
			merged[key] = value
		end
	end
	return merged
end

M.merge_flat = function(list)
	local merged = {}
	for _, v in pairs(list) do
		for _, c in pairs(v) do
			table.insert(merged, c)
		end
	end
	return merged
end

---@param property string
---@param callback function | nil
---@return table
M.pull_property_from_languages = function(property, callback)
	local ENABLED = require("constants.enabled").LANGUAGES
	local languages = require("constants.languages")
	local collected = {}
	callback = type(callback) == "function" and callback or M.flat_rename
	for _, value in ipairs(ENABLED) do
		collected[value] = callback(languages[value][property], value)
	end

	return collected
end

return M
