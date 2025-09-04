local lsp = require("utils.lsp")
local SERVERS = require("plugins.lang").SERVERS
local LSP_CONFIG_DIR = require("constants").LSP_CONFIG_DIR

local lsp_config_output = io.popen("ls " .. LSP_CONFIG_DIR, "r")

if lsp_config_output then
	for file in lsp_config_output:lines() do
		local server = string.match(file, "(.+)%..+")
		local config = dofile(LSP_CONFIG_DIR .. server .. ".lua")
		vim.lsp.config(server, config)
	end
end

require("utils.pull").ls_process(
	LSP_CONFIG_DIR,
	function()
		return true
	end,
	function(client)
		local config = dofile(LSP_CONFIG_DIR .. client .. ".lua")
		vim.lsp.config(client, config)
	end
)

vim.cmd([[hi FloatShadow guifg=white guibg=#1f2335]])
vim.cmd([[hi FloatShadowThrough guifg=white guibg=#1f2335]])
vim.lsp.config("*", { capabilities = lsp.create_capabilities() })
vim.lsp.enable(SERVERS)

require("ufo").setup()

lsp.setup_borders()
