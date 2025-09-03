import { z } from "zod";

import "./global.json";
import "./plugin.json";

const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;

const rhsSchema = z.object({
	buffer: z.number().or(z.boolean()),
	desc: z.string(),
	expr: z.boolean(),
	mode: z.enum(MODES),
	remap: z.boolean(),
	silent: z.boolean(),
});

export const pluginKeymapSchema = z.record(
	z.string(),
	z
		.tuple([
			z.string().describe("keymap"),
			z.string().describe("action"),
			rhsSchema.optional(),
		])
		.array(),
);

export const globalKeymapSchema = z.record(
	z.enum(generateModeOptions(MODES)),
	z.record(
		z.string().describe("keymap"),
		z.tuple([
			z.string().describe("action"),
			z.string().describe("description"),
			rhsSchema.optional(),
		]),
	),
);

// ai generated function to comma separate every possibility
function generateModeOptions<T extends readonly string[]>(modes: T): string[] {
	const results = new Set<string>();

	const total = 1 << modes.length;

	for (let mask = 1; mask < total; mask++) {
		const combo: string[] = [];
		for (let i = 0; i < modes.length; i++) {
			if (mask & (1 << i)) {
				combo.push(modes[i]);
			}
		}
		combo.sort(); // alphabetical
		results.add(combo.join(","));
	}

	return Array.from(results).sort(); // optional: sort final array alphabetically
}
