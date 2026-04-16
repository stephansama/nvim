if not vim.tbl_contains(require("lang.enabled").enabled, "ai") then return end

vim.pack.add({ { src = "https://github.com/folke/sidekick.nvim" } })

require("sidekick").setup({
	cli = {
		mux = {
			backend = "tmux",
			enabled = true,
		},
	},
})
