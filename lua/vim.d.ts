// side effect loading to autotranspile unimported files
import "./icons/neotree.json";
import "./keys/plugin.json";
import "./plugins/ui/dashboard/shortcuts.json";

declare global {
	interface KeymapOpts {
		desc?: string;
		noremap?: boolean;
		callback?: Function;
		replace_keycodes?: boolean;
	}

	// https://neovim.io/doc/user/lua.html#_lua-module:-vim.keymap
	interface Keymap {
		del: (
			this: void,
			modes: string | string[],
			lhs: string,
			rhs: string | Function,
			opts?: KeymapOpts,
		) => void;
		set: (
			this: void,
			modes: string | string[],
			lhs: string,
			rhs: string | Function,
			opts?: KeymapOpts,
		) => void;
	}

	interface IVim {
		keymap: Keymap;
		print: (this: void, ...rest: string[]) => void;
	}
}

export {};
