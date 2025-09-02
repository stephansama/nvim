import type { z } from "zod";

import { enabled } from "./enabled";
import * as packs from "./packs.json";
import { languageSchema } from "./schema";
type Schema = z.infer<typeof languageSchema>;

export const SERVERS = pullPropertyFromLanguages("servers");
// export const MASON = pullPropertyFromLanguages("mason");

// const output = io.popen("ls", "r");
//
// for (const out of output) {
// 	if (typeof out !== "string" && out) {
// 		for (const [line] of out.lines()) {
// 			print(line);
// 		}
// 	}
// }

export function pullLanguages(this: void) {
	const list = [];
	for (const key in packs) {
		list.push(key);
	}
	return list;
}

export function pullPropertyFromLanguages(this: void, l: keyof Schema) {
	const result = [];

	for (const language of enabled) {
		const schemaPack = packs[
			language as keyof typeof packs
		] as unknown as Schema;
		const pack = schemaPack[l];

		if (Array.isArray(pack)) {
			for (const elem of pack) {
				result.push(elem);
			}
		}
	}

	return result;
}
