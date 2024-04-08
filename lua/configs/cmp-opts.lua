---@see CMP https://github.com/hrsh7th/nvim-cmp
local cmp = require("cmp")
local icons = require("configs.icons").cmp
local border = require("utils").border

-- default fields order i.e completion word + item.kind + item.kind icons
local formatting_style = {
	fields = { "abbr", "kind", "menu" },
	format = function(_, item)
		local icon = icons[item.kind] or ""
		item.kind = string.format("%s %s", (icon .. " ") or icon, item.kind or "")
		return item
	end,
}

return {
	formatting = formatting_style,
	completion = { completeopt = "menu,menuone" },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "npm", keyword_length = 4 },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),
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
}
