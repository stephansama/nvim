import * as fsp from "node:fs/promises";
import path from "node:path";

await createAllModesFile();

async function createAllModesFile() {
	const ts = String.raw;
	await fsp.writeFile(
		path.join(import.meta.dirname, "./schemas/", "modes.ts"),
		ts`
export const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;

export const ALL_MODES = ${JSON.stringify(generateModeOptions())} as const;
		`.trim(),
	);
}

// ai generated function to comma separate every possibility
function generateModeOptions(
	modes = ["c", "i", "l", "n", "o", "s", "t", "v", "x"],
) {
	const results = new Set<string>();

	const total = 1 << modes.length;

	for (let mask = 1; mask < total; mask++) {
		const combo = [];
		for (const [index, mode] of modes.entries()) {
			if (mask & (1 << index)) {
				combo.push(mode);
			}
		}
		combo.sort();
		results.add(combo.join(","));
	}

	const sorted = [...results].toSorted();
	return sorted as string[];
}
