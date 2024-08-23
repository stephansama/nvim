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
		--- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
		require("lint").linters_by_ft = {
			sh = { "shellcheck" },
			zsh = { "zsh" },
			css = { "stylelint" },
			html = { "htmlhint" },
			json = { "jsonlint" },
			-- yaml = { "yamllint" },
			markdown = { "markdownlint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
		}
	end,
}
