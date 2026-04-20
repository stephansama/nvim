vim.pack.add(
	{ { src = "https://github.com/brevity1swos/rgx" } },
	{ load = function(plug)
		local subdir = plug.path .. "/plugin/nvim"
		-- add the real plugin root to runtimepath
		vim.opt.rtp:append(subdir)
		-- manually source plugin files (what :packadd would normally do)
		vim.cmd("runtime plugin/**/*.lua")
	end }
)

require("rgx").setup()
