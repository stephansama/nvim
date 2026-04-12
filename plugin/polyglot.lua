if not vim.tbl_contains(
	require("lang.enabled").enabled,
	"polyglot"
) then return end

vim.pack.add({ { src = "https://github.com/Canop/nvim-bacon" } })

require("bacon").setup({
	quickfix = {
		enabled = true,
		event_trigger = true,
	},
})
