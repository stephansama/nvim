import type { Schema } from "./schema";

import { PLUGIN_LANG_DIR } from "../constants/init";
import { enabled as enabledPlugins } from "../plugins/enabled";
import { enabled } from "./enabled";
import * as packs from "./packs.json";

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

	for (const language of enabled) {
		const schemaPack = packs[language] as Schema;
		const pack = schemaPack[key];

		result.push(pack);
	}

	return result as R[];
}

function loadPluginDirectories(this: void) {
	const foundPlugins: string[] = enabledPlugins;

	const [output] = io.popen(`ls ${PLUGIN_LANG_DIR}`, "r");
	if (output) {
		for (const [line] of output.lines()) {
			const [filename] = line.split(".");
			if (enabled.includes(filename as (typeof enabled)[number])) {
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
