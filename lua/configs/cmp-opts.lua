---@see CMP https://github.com/hrsh7th/nvim-cmp
local cmp = require("cmp")
local border = require("utils.ui").border
local keys = require("keys.init").cmp

local direction_or_snippet = function(cmp_method, condition, termcode)
	return function(fallback)
		if cmp.visible() then
			cmp[cmp_method]()
		elseif condition() then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes(termcode, true, true, true), "")
		else
			fallback()
		end
	end
end

return {
	completion = { completeopt = "menu,menuone" },
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("utils").cmp_format,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "npm", keyword_length = 4 },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = { border = border("CmpDocBorder"), winhighlight = "Normal:CmpDoc" },
		completion = {
			border = border("CmpCompBorder"),
			scrollbar = false,
			side_padding = 1,
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		},
	},
	mapping = {
		[keys.PREV] = cmp.mapping.select_prev_item(),
		[keys.NEXT] = cmp.mapping.select_next_item(),
		[keys.CLOSE] = cmp.mapping.close(),
		[keys.SELECT] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		[keys.COMPLETE] = cmp.mapping.complete(),
		[keys.SCROLL_DOCS_FORWARD] = cmp.mapping.scroll_docs(4),
		[keys.SCROLL_DOCS_BACKWARD] = cmp.mapping.scroll_docs(-4),
		[keys.NEXT_OR_SNIPPET] = cmp.mapping(
			direction_or_snippet("select_next_item", function()
				return require("luasnip").expand_or_jumpable()
			end, "<Plug>luasnip-expand-or-jump"),
			{ "i", "s" }
		),
		[keys.PREV_OR_SNIPPET] = cmp.mapping(
			direction_or_snippet("select_prev_item", function()
				return require("luasnip").jumpable(-1)
			end, "<Plug>luasnip-jump-prev"),
			{ "i", "s" }
		),
	},
}
