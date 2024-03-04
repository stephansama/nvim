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

header = string.rep("\n", 8) .. header .. string.rep("\n", 2)

local options = {
	theme = "doom",
	-- hide = { statusline = false },
	config = {
		header = vim.split(header, "\n"),
		footer = { "We have the technology 🔬" },
		center = {
			{
				action = "Telescope find_files",
				desc = " Find file",
				icon = " ",
				key = "f",
			},
			{
				action = "Telescope live_grep",
				desc = " Find text",
				icon = " ",
				key = "t",
			},
			-- {
			-- 	action = "ene | startinsert",
			-- 	desc = " New file",
			-- 	icon = " ",
			-- 	key = "n",
			-- },
			{
				action = "Telescope oldfiles",
				desc = " Recent files",
				icon = " ",
				key = "r",
			},
			{
				action = ":cd $OBSIDIAN",
				desc = " Switch to obsidian",
				icon = " ",
				key = "o",
			},
			{
				action = ":cd $NVCONF",
				desc = " Switch to nvim config",
				icon = " ",
				key = "c",
			},
			{
				action = "Lazy",
				desc = " Lazy",
				icon = "󰒲 ",
				key = "l",
			},
			{
				action = "Mason",
				desc = " Mason",
				icon = " ",
				key = "m",
			},
			{
				action = "qa",
				desc = " Quit",
				icon = " ",
				key = "q",
			},
		},
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
