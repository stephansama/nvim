require("srandle")

---> autocmd to underline all links <---
vim.cmd([[autocmd BufEnter * match Underlined /https\?:\/\/\S\+/]])

if vim.g.neovide then
	local transparency = 0.5

	vim.o.guifont = "FiraCode Nerd Font Mono:h22"
	vim.g.neovide_transparency = transparency
	vim.g.transparency = transparency
	vim.g.neovide_window_blurred = true
end
