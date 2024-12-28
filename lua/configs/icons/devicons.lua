--- @see Devicons https://github.com/nvim-tree/nvim-web-devicons
local M = {}

local icons = {
	commitlint = { icon = "󰜘", color = "#429488", name = "commitlint" },
	stylelint = { icon = "", name = "stylelint" },
	eslintrc = { icon = "󰱺", name = "eslintrc" },
	sitemap = { icon = "", name = "sitemap" },
	env = { icon = "", name = "env" },
	nx = { icon = "󱢴", color = "#FFFFFF", name = "nx" },
	gatsby = { icon = "󰹃", color = "#663399", name = "gatsby" },
	goextra = { icon = "", color = "#DA4F7A", name = "goextra" },
	go = { icon = "", color = "#4DA9BE", name = "go" },
	git = { icon = "", color = "#F05032", name = "git" },
	rss = { icon = "", color = "#FFA500", name = "rss" },
	xsl = { icon = "󰗀", color = "#E39F53", name = "xsl" },
	next = { icon = "󰰓", color = "#FFFFFF", name = "next" },
	yarn = { icon = "", color = "#2C8EBB", name = "yarn" },
	yaml = { icon = "󰈙", color = "#EC5F59", name = "yaml" },
	vite = { icon = "󱐋", color = "#F3B340", name = "vite" },
	astro = { icon = "", color = "#EF8547", name = "astro" },
	babel = { icon = "", color = "#F9DC3E", name = "babel" },
	archive = { icon = "", name = "archive", color = "#B0B447" },
	graphql = { icon = "", color = "#E10098", name = "graphql" },
	postcss = { icon = "󰁣", color = "#DD3A0A", name = "postcss" },
	cypress = { icon = "󰯲", color = "#69D3A7", name = "cypress" },
	test_ts = { icon = "", color = "#3178C6", name = "test_typescript" },
	test_js = { icon = "", color = "#F7DF1E", name = "test_javascript" },
	license = { icon = "", color = "#CDC058", name = "license" },
	prettier = { icon = "", color = "#F7B93E", name = "prettier" },
	changelog = { icon = "󰦖", color = "#97C15C", name = "changelog" },
	storybook = { icon = "󰂺", color = "#FF4785", name = "storybook" },
	typescript = { icon = "", color = "#3178C6", name = "typescript" },
	javascript = { icon = "󰌞", color = "#F7DF1E", name = "javascript" },
	dependabot = { icon = "", color = "#025E8C", name = "dependabot" },
	unlighthouse = { icon = "󰧿", color = "#F44B21", name = "unlighthouse" },
}

M.strict = true

M.override_by_extension = {
	graphqlrc = icons.graphql,
	["graphqlrc.toml"] = icons.graphql,
	["graphqlrc.json"] = icons.graphql,
	["graphqlrc.yaml"] = icons.graphql,
	["graphqlrc.yml"] = icons.graphql,
	["graphqlrc.js"] = icons.graphql,
	["graphqlrc.ts"] = icons.graphql,
	-- [".luacheckrc"] = { icon = "", color = "#2C2D72", name = "lua" },
	xcf = { icon = "", name = "gimp" },
	["code-profile"] = { icon = "󰨞", color = "#007ACC", name = "vscode" },
	prettierrc = icons.prettier,
	prettierignore = icons.prettier,
	js = icons.javascript,
	cjs = icons.javascript,
	mjs = icons.javascript,
	njk = { icon = "", color = "#1C4913", name = "nunjucks" },
	-- archives
	asm = { icon = "" },
	dmg = icons.archive,
	zip = icons.archive,
	["7z"] = icons.archive,
	["tar.gz"] = icons.archive,
	-- babelrc
	["babelrc.json"] = icons.babel,
	["babelrc.cts"] = icons.babel,
	["babelrc.cjs"] = icons.babel,
	["babelrc.mjs"] = icons.babel,
	["babelrc.js"] = icons.babel,
	-- git
	gitkeep = icons.git,
	gitconfig = icons.git,
	gitignore = icons.git,
	gitignore_global = icons.git,
	postcss = icons.postcss,
	astro = icons.astro,
	pcss = icons.postcss,
	yaml = icons.yaml,
	yml = icons.yaml,
	xsl = icons.xsl,
	ts = icons.typescript,
	gql = icons.graphql,
	go = icons.go,
	graphql = icons.graphql,
	Jenkinsfile = { icon = "", name = "jenkins" },
	pug = { icon = "", color = "#A86454", name = "pug" },
	["cy.ts"] = icons.cypress,
	["cy.js"] = icons.cypress,
	["stories.js"] = icons.storybook,
	["stories.jsx"] = icons.storybook,
	["stories.tsx"] = icons.storybook,
	["stories.ts"] = icons.storybook,
	["d.ts"] = { icon = "", color = "#3178C6", name = "ts_definition" },
}

M.override_by_filename = {
	["nx.json"] = icons.nx,
	["project.json"] = icons.nx,
	["amplify.yml"] = { icon = "󰸏" },
	["_redirects"] = { icon = "" },
	[".stow-local-ignore"] = { icon = "" },
	["wrangler.toml"] = { icon = "☁", color = "#F38020", name = "cloudflare" },
	[".babelrc"] = icons.babel,
	[".nvmrc"] = { icon = "󰎙", color = "#339933", name = "nvm" },
	[".commitlintrc"] = icons.commitlint,
	[".commitlintrc.ts"] = icons.commitlint,
	[".commitlintrc.js"] = icons.commitlint,
	[".commitlintrc.cjs"] = icons.commitlint,
	[".commitlintrc.cts"] = icons.commitlint,
	[".commitlintrc.mjs"] = icons.commitlint,
	[".commitlintrc.yml"] = icons.commitlint,
	[".commitlintrc.yaml"] = icons.commitlint,
	[".commitlintrc.json"] = icons.commitlint,
	["log.txt"] = { icon = "", name = "log" },
	["logs.txt"] = { icon = "", name = "log" },
	["go.mod"] = icons.goextra,
	["go.sum"] = icons.goextra,
	["go.work"] = icons.goextra,
	-- gatsby
	["gatsby-ssr.js"] = icons.gatsby,
	["gatsby-config.js"] = icons.gatsby,
	["gatsby-browser.js"] = icons.gatsby,
	["tsconfig.base.json"] = icons.typescript,
	-- rss
	["rss.xml"] = icons.rss,
	["rss.xml.ts"] = icons.rss,
	["rss.xml.js"] = icons.rss,
	-- graphql
	["graphql.config.toml"] = icons.graphql,
	["graphql.config.ts"] = icons.graphql,
	["graphql.config.js"] = icons.graphql,
	["graphql.config.json"] = icons.graphql,
	-- sitemap
	["sitemap.xml"] = icons.sitemap,
	["sitemap.xml.ts"] = icons.sitemap,
	["sitemap.xml.js"] = icons.sitemap,
	["prettier.config.js"] = icons.prettier,
	["go.work.sum"] = icons.goextra,
	[".env.local"] = icons.env,
	[".env.sample"] = icons.env,
	[".env.example"] = icons.env,
	["electron-flags.conf"] = { icon = "", color = "#47848F", name = "electron" },
	[".env.production"] = icons.env,
	["contributing.md"] = { icon = "󰅍", color = "#F7CC4F", name = "contributing" },
	["authors.md"] = { icon = "", color = "#E15241", name = "authors" },
	["license.md"] = icons.license,
	["license.txt"] = icons.license,
	["changelog.md"] = icons.changelog,
	["changelog.txt"] = icons.changelog,
	["dependabot.yml"] = icons.dependabot,
	["readme.md"] = { icon = "󰋼", color = "#5EA3EF", name = "readme" },
	[".tmux.conf"] = { icon = "", color = "#1BB91F", name = "tmux" },
	["vercel.json"] = { icon = "󰔶", color = "#FFFFFF", name = "vercel" },
	["netlify.toml"] = { icon = "", color = "#00C7B7", name = "netlify" },
	["nodemon.json"] = { icon = "", color = "#76D04B", name = "nodemon" },
	[".eslintrc.js"] = icons.eslintrc,
	[".eslintrc.cjs"] = icons.eslintrc,
	[".eslintrc.json"] = icons.eslintrc,
	["eslint.config.js"] = icons.eslintrc,
	["eslint.config.cjs"] = icons.eslintrc,
	["eslint.config.mjs"] = icons.eslintrc,
	["unlighthouse.config.js"] = icons.unlighthouse,
	["unlighthouse.config.ts"] = icons.unlighthouse,
	-- vite ts
	["vite.config.ts"] = icons.vite,
	["vitest.config.ts"] = icons.vite,
	["vitest.config.mts"] = icons.vite,
	["vitest.config.cts"] = icons.vite,
	-- vite js
	["vite.config.js"] = icons.vite,
	["vitest.config.js"] = icons.vite,
	["vitest.config.mjs"] = icons.vite,
	["vitest.config.cjs"] = icons.vite,
	-- astro
	["astro.config.mjs"] = icons.astro,
	["astro.config.ts"] = icons.astro,
	-- babel
	["babel.config.json"] = icons.babel,
	["babel.config.cts"] = icons.babel,
	["babel.config.cjs"] = icons.babel,
	["babel.config.mjs"] = icons.babel,
	["babel.config.js"] = icons.babel,
	["starship.toml"] = { icon = "", color = "#D73167", name = "Starship" },
	-- postcss
	["postcss.config.js"] = icons.postcss,
	["postcss.config.mjs"] = icons.postcss,
	["postcss.config.cjs"] = icons.postcss,
	-- next
	["next.config.ts"] = icons.next,
	["next.config.js"] = icons.next,
	["next.config.mjs"] = icons.next,
	-- cypress
	["cypress.config.ts"] = icons.cypress,
	["cypress.config.js"] = icons.cypress,
	["ads.txt"] = { icon = "󰲇", color = "#4285F4", name = "GoogleAds" },
	["todo.md"] = { icon = "", color = "#A6E3A1", name = "todo" },
	[".viminfo"] = { icon = "", color = "#019733", name = "vim" },
	[".yarnrc"] = icons.yarn,
	["yarn.lock"] = icons.yarn,
	["robots.txt"] = { icon = "󰚩", color = "#F38BA8", name = "robots" },
	["lazy-lock.json"] = { icon = "󰒲", color = "#457BE2", name = "lazy" },
	["cargo.toml"] = { icon = "", color = "#D24933", name = "cargo.toml" },
	["jsconfig.json"] = { icon = "", color = "#F7DF1E", name = "jsconfig" },
	["pnpm-lock.yaml"] = { icon = "󰛷", color = "#F69220", name = "pnpm-lock.yaml" },
	["pnpm-workspace.yaml"] = { icon = "󰛷", color = "#FFFFFF", name = "pnpm-workspace.yaml" },
	["playwright.config.ts"] = { icon = "󰴂", color = "#2EAD33", name = "playwright" },
	-- vscode
	["extensions.json"] = { icon = "", color = "#C59F46", name = "extensions" },
	["launch.json"] = { icon = "", color = "#C59F46", name = "launch" },
	-- stylelint
	[".stylelintrc"] = icons.stylelint,
	[".stylelintrc.js"] = icons.stylelint,
	[".stylelintrc.mjs"] = icons.stylelint,
	[".stylelintrc.cjs"] = icons.stylelint,
	[".stylelintrc.json"] = icons.stylelint,
	["stylelint.config.cjs"] = icons.stylelint,
	["stylelint.config.mjs"] = icons.stylelint,
}

return M
