return {
	"hedyhli/outline.nvim",
	ft = "*",
	config = function(_, opts)
		-- Example mapping to toggle outline
		vim.keymap.set("n", "|", vim.cmd.Outline, { desc = "Toggle Outline" })
		require("outline").setup(opts)
	end,
}
