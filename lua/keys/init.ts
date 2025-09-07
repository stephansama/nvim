import type { GlobalKeymapConfig } from "@/schemas/keymaps";
import * as global from "./global.json";

type Schema = Omit<typeof global, "$schema">;
type SchemaKey = keyof Schema;
type SchemaElement = Schema[SchemaKey];

for (const modes in global) {
	if (modes === "$schema") continue;

	const modeList = modes.split(",");
	const current = global[modes as SchemaKey] as SchemaElement;

	if (typeof current === "string") continue;

	for (const keymap in current) {
		const currentKeymap = current[
			keymap as keyof typeof current
		] as GlobalKeymapConfig;

		vim.keymap.set(
			modeList,
			keymap,
			currentKeymap[0],
			Object.assign(
				{ desc: currentKeymap[1] },
				typeof currentKeymap[2] === "object" ? currentKeymap[2] : {},
			),
		);
	}
}
