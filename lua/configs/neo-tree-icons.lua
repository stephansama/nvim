-- https://www.nerdfonts.com/cheat-sheet
local icons = {
	route = "󰑪",
	script = "󰯂",
	style = "",
	app = "󱂵",
	doc = "󱂷",
	lib = "󰌱",
	upload = "󰉙",
	download = "󰉍",
	key = "󰢬",
	token = "󰢬",
	layout = "󰹫",
	middleware = "󰽞",
	icon = "󰚝",
	admin = "󰉐",
	-- util
	util = "󱁿",
	utility = "󱁿",
	utilities = "󱁿",
	www = "󰖟",
	public = "󰖟",
	static = "󰖟",
	global = "󰖟",
	schema = "󱋣",
	-- public = "󱞊",
	info = "󱂷",
	content = "󰣞",
	fonts = "",
	target = "󰩷",
	debug = "",
	test = "󰙨",
	cache = "󰪺",
	-- storybook = "󰂺",
	[".git"] = "",
	[".github"] = "",
	[".vscode"] = "󰨞",
	common = "󱁽",
	component = "󰀻",
	-- component = "󱁽",
	node_modules = "",
	dist = "",
	build = "",
	bin = "",
	templates = "",
	views = "",
	src = "󱧶",
	hook = "󰛢",
	context = "",
	page = "󱧶",
	-- images
	assets = "󰉏",
	images = "󰉏",
	-- configs
	conf = "",
	config = "",
	plugin = "",
	-- server
	api = "󰒍",
	server = "󰒋",
	serverless = "󰊕",
	["function"] = "󰊕",
	-- db
	database = "󰆼",
	data = "󰆼",
	db = "󰆼",
	-- languages
	javascript = "",
	typescript = "",
	mongodb = "",
	sass = "󰟬",
	html = "",
	css = "󰛦",
	lua = "",
	sql = "󰆼",
}

return {
	icons = icons,
	get_icon = function(name)
		local name_without_last_char = string.sub(name, 1, string.len(name) - 1)
		local name_without_first_char = string.sub(name, 2)
		local found_icon = icons[name] or icons[name_without_last_char] or icons[name_without_first_char]
		return found_icon
	end,
}
