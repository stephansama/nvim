import type { Schema } from "./schema";

import { enabled } from "./enabled";
import * as packs from "./packs.json";

const parsers = pullProperty("treesitter_parser");
export const FORMATTERS = mergeKeyValue(pullProperty("formatters"));
export const LINTERS = mergeKeyValue(pullProperty("linters"));
export const MASON = mergeFlat(pullProperty("mason"));
export const SERVERS = mergeFlat(pullProperty("servers"));
export const TREESITTER = mergeFlat(pullProperty("treesitter"));
export const TREESITTER_PARSERS = mergeKeyValue(parsers);

function mergeFlat<T>(this: void, arr: T[][]) {
	const result = [];

	for (const list of arr) {
		for (const elem of list) {
			result.push(elem);
		}
	}

	return result;
}

function mergeKeyValue<T>(this: void, records: Record<string, T>[]) {
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
		const schemaPack = packs[language as keyof typeof packs] as Schema;
		const pack = schemaPack[key];

		result.push(pack);
	}

	return result as R[];
}
