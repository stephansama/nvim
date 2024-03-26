return {
	"mfussenegger/nvim-lint",
	init = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			html = { "htmlhint" },
			json = { "jsonlint" },
			zsh = { "zsh" },
		}
	end,
}
