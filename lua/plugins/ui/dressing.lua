local function override_builtins(builtins)
	for _, builtin in pairs(builtins) do
		vim.ui[builtin] = function(...)
			require("lazy").load({
				plugins = { "dressing.nvim" },
			})
			return vim.ui[builtin](...)
		end
	end
end

return {
	"stevearc/dressing.nvim",
	init = override_builtins({ "select", "input" }),
}
