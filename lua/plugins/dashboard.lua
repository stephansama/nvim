local expand_actions = require("utils").expand_actions
local header = [[
        ▄▄▄▄▄███████████████████▄▄▄▄▄     
      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   
     █▀████████▄             ▀▀████ ▀██▄  
    █▄▄██████████████████▄▄▄         ▄██▀ 
     ▀█████████████████████████▄    ▄██▀  
       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    
         ▀███▄              ▀██████▀      
           ▀██████▄        ▄████▀         
              ▀█████▄▄▄▄▄▄▄███▀           
                ▀████▀▀▀████▀             
                  ▀███▄███▀               
                     ▀█▀                  
]]

-- add padding to header
header = string.rep("\n", 2) .. header .. string.rep("\n", 2)

local opts = {
	theme = "doom",
	config = {
		header = vim.split(header, "\n"),
		footer = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return { " loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
		end,
		center = expand_actions({
			{ " ", "f", "Find file", "Telescope find_files" },
			{ " ", "w", "Find text", "Telescope live_grep" },
			{ " ", "r", "Recent files", "Telescope oldfiles" },
			{ " ", "o", "Switch to obsidian", "cd $OBSIDIAN" },
			{ " ", "c", "Switch to config", "cd $NVCONF" },
			{ "󰒲 ", "l", "Lazy", "Lazy" },
			{ " ", "m", "Mason", "Mason" },
			{ " ", "q", "Quit", "qa" },
		}),
	},
}

local init = function()
	vim.keymap.set("n", "<leader>ld", ":bufdo bd!<CR>:Dashboard<CR>", { desc = "Close all buffers" })
	vim.cmd([[hi DashboardHeader guifg=#782021 guibg=none]])
end

return {
	"nvimdev/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	opts = opts,
	init = init,
}
