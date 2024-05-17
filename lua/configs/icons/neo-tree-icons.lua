---@desc  inspired by material icon theme
---@see MaterialFolderIcons https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/images/folderIcons.png
return {
	icon = {
		folder_closed = "",
		folder_open = "",
		folder_empty = "󰜌",
		-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
		-- then these will never be used.
		default = "*",
		highlight = "NeoTreeFileIcon",
	},
	symbols = {
		-- Change type
		added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
		modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
		deleted = "✖", -- this can only be used in the git_status source
		renamed = "󰁕", -- this can only be used in the git_status source
		-- Status type
		untracked = "",
		ignored = "",
		unstaged = "󰄱",
		staged = "",
		conflict = "",
	},
	icons = {
		tabby = "󰄛",
		["tabby-client"] = "󰄛",
		npm = "",
		nvm = "󰎙",
		desktop = "",
		document = "󱧶",
		bun = "󰳮",
		movie = "󰎁",
		book = "",
		store = "󰓜",
		footer = "󰛻",
		header = "󰛼",
		navbar = "󰛼",
		applications = "",
		trash = "",
		volume = "󰋊",
		library = "",
		command = "",
		cypress = "󰯲",
		snippet = "󰩫",
		editor = "",
		scraper = "󱇪",
		script = "󰯂",
		style = "",
		route = "󰑪",
		mail = "",
		home = "󱂵",
		e2e = "󰕥",
		cmd = "",
		app = "󱂵",
		doc = "󱂷",
		lib = "󰌱",
		upload = "󰉙",
		download = "󰉍",
		key = "󰢬",
		token = "󰢬",
		layout = "󰕮",
		middleware = "󰽞",
		lang = "󰗊",
		language = "󰗊",
		environment = "",
		icon = "󰚝",
		admin = "󰉐",
		auth = "󰉐",
		secure = "󰉐",
		animation = "󰗘",
		audio = "󰎆",
		core = "",
		-- util
		util = "󱁿",
		utility = "󱁿",
		utilities = "󱁿",
		web = "󰖟",
		www = "󰖟",
		public = "󰖟",
		global = "󰖟",
		static = "󰖟",
		schema = "󱋣",
		model = "󱋣",
		mdx = "",
		markdown = "",
		misc = "",
		-- public = "󱞊",
		info = "󱂷",
		content = "󰣞",
		fonts = "",
		goal = "",
		target = "",
		nvim = "",
		-- target = "󰩷",
		--
		robot = "󰚩",
		debug = "",
		test = "",
		-- test = "󰙨",
		temp = "󰪺",
		tmp = "󰪺",
		event = "󰂚",
		-- operating systems
		ios = "",
		macos = "",
		linux = "",
		window = "",
		android = "",
		design = "󰏘",
		note = "",
		board = "",
		article = "󱔗",
		resource = "󱔗",
		calendar = "",
		weekly = "",
		theme = "󰏘",
		color = "󰏘",
		error = "󰷌",
		cache = "󰪺",
		pkg = "󰏓",
		package = "󰏓",
		usr = "",
		user = "",
		users = "",
		storybook = "󰂺",
		github = "",
		workflow = "",
		git = "",
		vscode = "󰨞",
		vite = "󱐋",
		common = "󱁽",
		other = "󱁽",
		client = "󰦉",
		backend = "󰒋",
		frontend = "󰦉",
		ui = "󰦉",
		mobile = "",
		constant = "",
		i18n = "󰗊",
		ci = "󰴋",
		generator = "󰴋",
		generated = "󰴋",
		generate = "󰴋",
		component = "󰀻",
		node_modules = "",
		pnpm = "",
		dist = "",
		build = "",
		bin = "",
		release = "",
		template = "",
		views = "",
		src = "",
		hook = "󰛢",
		context = "",
		log = "",
		kubernetes = "󱃾",
		page = "󱧶",
		import = "󰉗",
		include = "󰉗",
		-- images
		assets = "󰉏",
		images = "󰉏",
		media = "󰉏",
		-- configs
		conf = "",
		config = "",
		plugin = "󰐱",
		ext = "",
		extension = "",
		guard = "󰦝",
		coverage = "󰕥",
		project = "",
		json = "",
		share = "",
		private = "󱧴",
		python = "",
		money = "",
		-- server
		api = "󰒍",
		server = "󰒋",
		homelab = "󰒋",
		serverless = "󰊕",
		["function"] = "󰊕",
		-- db
		database = "󰆼",
		data = "󰆼",
		db = "󰆼",
		-- languages
		types = "",
		["react-dom"] = "󰜈",
		tailwindcss = "󱏿",
		c = "",
		go = "",
		ts = "󰛦",
		js = "",
		cpp = "",
		next = "󰰓",
		webpack = "󰜫",
		obsidian = "󱥐",
		javascript = "",
		typescript = "󰛦",
		postcss = "",
		ssh = "",
		tmux = "",
		vim = "",
		music = "󱍙",
		picture = "󰉏",
		video = "󰕧",
		haskell = "",
		mongodb = "",
		eslint = "󰱺",
		docker = "󰡨",
		svelte = "",
		["svelte-kit"] = "",
		astro = "",
		react = "󰜈",
		java = "",
		rust = "",
		cargo = "",
		rustup = "",
		sass = "󰟬",
		html = "",
		vue = "",
		svg = "󰜡",
		css = "",
		lua = "",
		sql = "󰆼",
		youtube = "󰗃",
		srandle = "",
	},
}