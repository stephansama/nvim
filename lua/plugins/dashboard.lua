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

local options = {
	theme = "doom",
	-- hide = { statusline = false },
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
			{ " ", "q", "Quit", vim.cmd.qa },
		}),
	},
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	init = function()
		vim.cmd([[hi DashboardHeader guifg=#782021 guibg=none]])
	end,
	config = function()
		require("dashboard").setup(options)
	end,
}
