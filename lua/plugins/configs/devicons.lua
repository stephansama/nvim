-- https://www.nerdfonts.com/cheat-sheet
-- https://github.com/nvim-tree/nvim-web-devicons
return {
	-- override = {
	-- 	postcss = { icon = "", color = "#DD3A0A", name = "postcss" },
	-- },
	override_by_extension = {
		prettierignore = { icon = "󰉽", color = "#F7B93E", name = "prettier" },
		prettierrc = { icon = "󰉽", color = "#F7B93E", name = "prettier" },
		gitignore = { icon = "", color = "#F05032", name = "gitignore" },
		ts = { icon = "", color = "#3178C6", name = "typescript" },
		astro = { icon = "", color = "#EF8547", name = "astro" },
		yaml = { icon = "󰈙", color = "#EC5F59", name = "yaml" },
		yml = { icon = "󰈙", color = "#EC5F59", name = "yaml" },
		pcss = { icon = "", color = "#DD3A0A", name = "postcss" },
		postcss = { icon = "", color = "#DD3A0A", name = "postcss" },
		xsl = { icon = "󰗀", color = "#E39F53", name = "xsl" },
	},
	override_by_filename = {
		[".env.local"] = { icon = "", name = "env" },
		[".env.sample"] = { icon = "", name = "env" },
		["dependabot.yml"] = { icon = "", color = "", name = "dependabot" },
		["go.mod"] = { icon = "", color = "#4285F4", name = "GoogleAds" },
		["go.sum"] = { icon = "", color = "#4285F4", name = "GoogleAds" },
		["go.work"] = { icon = "", color = "#4285F4", name = "GoogleAds" },
		["go.work.sum"] = { icon = "", color = "#4285F4", name = "GoogleAds" },
		["ads.txt"] = { icon = "󰲇", color = "#4285F4", name = "GoogleAds" },
		["Icon"] = { icon = "", color = "white", name = "AppleIcon" },
		["postcss.config.js"] = { icon = "", color = "#DD3A0A", name = "postcss" },
		["postcss.config.mjs"] = { icon = "", color = "#DD3A0A", name = "postcss" },
		["postcss.config.cjs"] = { icon = "", color = "#DD3A0A", name = "postcss" },
		["pnpm-lock.yaml"] = { icon = "", color = "#F69220", name = "pnpm-lock.yaml" },
		["cargo.toml"] = { icon = "", color = "#D24933", name = "cargo.toml" },
		["jsconfig.json"] = { icon = "", color = "#F7DF1E", name = "jsconfig" },
		["todo.md"] = { icon = "", color = "#A6E3A1", name = "todo" },
		["vite.config.ts"] = { icon = "󱐋", color = "#F3B340", name = "vite" },
		["vite.config.js"] = { icon = "󱐋", color = "#F3B340", name = "vite" },
		["astro.config.mjs"] = { icon = "", color = "#EF8547", name = "astro" },
		["yarn.lock"] = { icon = "", color = "#2C8EBB", name = "yarn" },
		["robots.txt"] = { icon = "󰚩", color = "#F38BA8", name = "robots" },
		-- TODO: overrides for entrypoint filenames
		-- ["init.lua"] = { icon = "", color = "#B2CFE5", name = "init.lua" },
	},
}
