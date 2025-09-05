#!/usr/bin/env node

import * as fsp from "node:fs/promises";

const file = JSON.stringify(generateModeOptions());

await fsp.writeFile("./lua/keys/modes.json", file);

// ai generated function to comma separate every possibility
function generateModeOptions(
	modes = ["c", "i", "l", "n", "o", "s", "t", "v", "x"],
) {
	const results = new Set();

	const total = 1 << modes.length;

	for (let mask = 1; mask < total; mask++) {
		const combo = [];
		for (let i = 0; i < modes.length; i++) {
			if (mask & (1 << i)) {
				combo.push(modes[i]);
			}
		}
		combo.sort();
		results.add(combo.join(","));
	}

	return Array.from(results).sort();
}
