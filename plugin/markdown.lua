if not vim.tbl_contains(
	require("lang.enabled").enabled,
	"markdown"
) then return end

vim.g.table_mode_tableize_map = "<leader>mc"

vim.api.nvim_create_autocmd("PackChanged", { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	local is_valid = kind == "install" or kind == "update"
	if name == "markdown-preview.nvim" and is_valid then
		vim.cmd.packadd("markdown-preview.nvim")
		vim.fn["mkdp#util#install"]()
		vim.print(vim.inspect("installing markdown preview"))
	end
end })

vim.pack.add({
	{ src = "https://github.com/dhruvasagar/vim-table-mode" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})
