---@desc  inspired by material icon theme
--- https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/images/folderIcons.png
--- https://www.nerdfonts.com/cheat-sheet
local icons = {
	route = "󰑪",
	mail = "",
	script = "󰯂",
	style = "",
	home = "󱂵",
	app = "󱂵",
	doc = "󱂷",
	lib = "󰌱",
	upload = "󰉙",
	download = "󰉍",
	key = "󰢬",
	token = "󰢬",
	layout = "󰕮",
	-- layout = "󰹫",
	middleware = "󰽞",
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
	www = "󰖟",
	public = "󰖟",
	global = "󰖟",
	static = "󰖟",
	schema = "󱋣",
	-- public = "󱞊",
	info = "󱂷",
	content = "󰣞",
	fonts = "",
	goal = "",
	target = "",
	nvim = "",
	-- target = "󰩷",
	debug = "",
	test = "󰙨",
	temp = "󰪺",
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
	package = "󰏓",
	user = "",
	-- users = "",
	-- storybook = "󰂺",
	github = "",
	git = "",
	vscode = "󰨞",
	vite = "󱐋",
	common = "󱁽",
	other = "󱁽",
	client = "󰦉",
	mobile = "",
	constant = "",
	i18n = "󰗊",
	ci = "󰴋",
	generator = "󰴋",
	component = "󰀻",
	node_modules = "",
	pnpm = "",
	dist = "",
	build = "",
	bin = "",
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
	-- configs
	conf = "",
	config = "",
	plugin = "󰐱",
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
	go = "",
	ts = "󰛦",
	js = "",
	javascript = "",
	typescript = "󰛦",
	postcss = "",
	mongodb = "",
	eslint = "󰱺",
	docker = "󰡨",
	svelte = "",
	astro = "",
	react = "󰜈",
	java = "",
	rust = "",
	sass = "󰟬",
	html = "",
	vue = "",
	svg = "󰜡",
	css = "",
	lua = "",
	sql = "󰆼",
	youtube = "󰗃",
}

return {
	icons = icons,
	get_icon = function(name)
		name = string.lower(name)
		local last_element = string.len(name) - 1
		local name_without_first_char = string.sub(name, 2)
		local name_without_last_char = string.sub(name, 1, last_element)
		local name_without_ending_chars = string.sub(name, 2, last_element)
		return icons[name]
			or icons[name_without_first_char]
			or icons[name_without_last_char]
			or icons[name_without_ending_chars]
	end,
}
