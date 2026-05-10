// side effect loading to autotranspile unimported files
import "./icons/neotree.json";
import "./keys/plugin.json";
import "./utils/dashboard/shortcuts.json";

declare global {
	interface IVim {
		json: {
			decode: (
				this: void,
				string_: string,
				options?: JsonEncodeOptions,
			) => object;
			encode: (
				this: void,
				object: object,
				options?: JsonEncodeOptions,
			) => string;
		};
		keymap: Keymap;
		print: (this: void, ...rest: string[]) => void;
	}

	interface JsonEncodeOptions {
		luanil: {
			object?: boolean;
			string?: boolean;
		};
	}

	// https://neovim.io/doc/user/lua.html#_lua-module:-vim.keymap
	interface Keymap {
		del: (
			this: void,
			modes: string | string[],
			lhs: string,
			rhs: string,
			options?: KeymapOptions,
		) => void;
		set: (
			this: void,
			modes: string | string[],
			lhs: string,
			rhs: string,
			options?: KeymapOptions,
		) => void;
	}

	interface KeymapOptions {
		desc?: string;
		noremap?: boolean;
		replace_keycodes?: boolean;
	}
}

export {};
