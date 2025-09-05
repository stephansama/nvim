import type { Schema } from "./schema";

import { PLUGIN_LANG_DIR } from "../../config/constants";
import { enabled as enabledPlugins } from "../enabled";
import { enabled as enabledLanguages } from "./enabled";
import * as packs from "./packs.json";

type EnabledLanguageKey = (typeof enabledLanguages)[number];

export const PLUGINS = loadPluginDirectories();
export const FORMATTERS = mergeKV(pullProperty("formatters"));
export const LINTERS = mergeKV(pullProperty("linters"));
export const MASON = mergeFlat(pullProperty("mason"));
export const SERVERS = mergeFlat(pullProperty("servers"));
export const TREESITTER = mergeFlat(pullProperty("treesitter"));
export const TREESITTER_PARSERS = mergeKV(pullProperty("treesitter_parser"));

function mergeFlat<T>(this: void, arr: T[][]) {
	const result = [];

	for (const list of arr) {
		for (const elem of list) {
			result.push(elem);
		}
	}

	return result;
}

function mergeKV<T>(this: void, records: Record<string, T>[]) {
	const result: Record<string, T> = {};

	for (const record of records) {
		for (const key in record) {
			result[key] = record[key];
		}
	}

	return result;
}

function pullProperty<T extends keyof Schema, R = Schema[T]>(
	this: void,
	key: T,
): R[] {
	const result = [];

	for (const language of enabledLanguages) {
		const schemaPack = packs[language] as Schema;
		const pack = schemaPack[key];

		result.push(pack);
	}

	return result as R[];
}

function loadPluginDirectories(this: void) {
	const foundPlugins: string[] = enabledPlugins;

	const output = vim.fn.readdir(PLUGIN_LANG_DIR) as string[];
	if (output) {
		for (const line of output) {
			const [filename] = line.split(".");
			if (enabledLanguages.includes(filename as EnabledLanguageKey)) {
				foundPlugins.push("lang." + filename);
			}
		}
	}

	const root = "plugins";
	const plugins = [{ import: `${root}.init` }];

	for (const plugin of foundPlugins) {
		plugins.push({ import: `${root}.${plugin}` });
	}

	return plugins;
}
