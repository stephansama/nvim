require("srandle.settings")
require("srandle.leader")
require("srandle.lazy")
require("srandle.keymaps")

vim.cmd([[colorscheme catppuccin]])
vim.cmd([[hi FloatBorder guifg=White guibg=none]])
vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
vim.cmd([[hi MiniIndentscopeSymbol guifg=#C93638 guibg=none]])
vim.cmd([[hi NoiceCmdlinePopupBorder guifg=#C93638 guibg=none]])
vim.cmd([[UfoEnableFold]])

require("utils.dashboard").color_dashboard()
