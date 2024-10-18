local callback = function()
	require("lint").try_lint()
end

return {
	"mfussenegger/nvim-lint",
	init = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = callback })
	end,
	config = function()
		require("lint").linters_by_ft = require("constants.linters")
	end,
}
