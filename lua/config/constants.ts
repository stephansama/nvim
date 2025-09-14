export const PACKAGE_JSON_URL = `https://www.npmjs.com/package/`;

export const LEADER = " ";

export const HOME = os.getenv("HOME");
export const NVIM_APPNAME = os.getenv("NVIM_APPNAME") || "nvim";

export const SNIPPETS_DIR = "./snippets/";
export const NVIM_CONFIG_DIR = HOME + "/.config/" + NVIM_APPNAME;
export const ASCII_DIR = NVIM_CONFIG_DIR + "/images/";
export const PLUGIN_LANG_DIR = NVIM_CONFIG_DIR + "/lua/plugins/lang/";
export const TREESITTER_PARSER_INSTALL_DIR = HOME + "/.local/share/treesitter";

export const THEME = "catppuccin";
export const THEME_DARKMODE = "catppuccin-mocha";
export const THEME_LIGHTMODE = "catppuccin-latte";

export const PACKAGE_INFO_COLORS = {
	up_to_date: "#9CDAE9",
	outdated: "#F5E3B5",
};

export const DASHBOARD_LIGHTMODE = [
	"#dc8a78",
	"#dd7878",
	"#ea76cb",
	"#8839ef",
	"#d20f39",
	"#e64553",
	"#fe640b",
	"#df8e1d",
	"#40a02b",
	"#179299",
	"#04a5e5",
	"#209fb5",
	"#1e66f5",
	"#7287fd",
	"#5c5f77",
];

export const DASHBOARD_DARKMODE = [
	"#F5E0DC",
	"#F2CDCD",
	"#F5C2E7",
	"#CBA6F7",
	"#F38BA8",
	"#EBA0AC",
	"#FAB387",
	"#F9E2AF",
	"#A6E3A1",
	"#94E2D5",
	"#89DCEB",
	"#74C7EC",
	"#89B4FA",
	"#B4BEFE",
];

export const COMMENT_FILETYPES = [
	"c",
	"sh",
	"go",
	"cpp",
	"lua",
	"php",
	"vue",
	"rust",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
];

export const VIM_FT_FILENAMES = {
	[".env.local"]: "sh",
	[".env.sample"]: "sh",
	[".env.example"]: "sh",
	[".env.production"]: "sh",
	["kitty.conf"]: "kconfig",
	["hyprland.conf"]: "hyprlang",
	["hyprpaper.conf"]: "hyprlang",
};

export const VIM_FT_EXTENSIONS = {
	["code-snippets"]: "jsonc",
	mdx: "markdown.mdx",
	zsh: "sh",
	pcss: "css",
	http: "http",
	rasi: "rasi",
	templ: "templ",
	postcss: "css",
	jinja2: "jinja",
	jinja: "jinja",
	j2: "jinja",
};

export const VIM_FT_PATTERNS = { ".*%.blade%.php": "blade" };

export const INDENT_EXCLUDE_BUFTYPES = [
	"prompt",
	"nofile",
	"quickfix",
	"terminal",
	"neotest-summary",
];

export const INDENT_EXCLUDE_FILETYPES = [
	"man",
	"help",
	"lazy",
	"alpha",
	"mason",
	"notify",
	"packer",
	"lspinfo",
	"trouble",
	"Trouble",
	"neo-tree",
	"lazyterm",
	"dashboard",
	"gitcommit",
	"toggleterm",
	"checkhealth",
	"leetcode.nvim",
	"TelescopePrompt",
	"TelescopeResults",
];

export const WEB_FILETYPES = [
	"hbs",
	"jsx",
	"php",
	"tsx",
	"vue",
	"xml",
	"html",
	"astro",
	"templ",
	"svelte",
	"glimmer",
	"markdown",
	"rescript",
	"handlebars",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
];

export const EMMET_FILETYPES = [
	"css",
	"pug",
	"vue",
	"html",
	"less",
	"sass",
	"scss",
	"astro",
	"eruby",
	"svelte",
	"htmldjango",
	"htmlangular",
	"javascriptreact",
	"typescriptreact",
];
