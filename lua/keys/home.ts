import * as global from "./global.json";

// array indexing is still lua based
type Schema = Omit<typeof global, "$schema">;
type SchemaKey = keyof Schema;
type SchemaElement = Schema[keyof Schema];

for (const modes in global) {
	if (modes === "$schema") continue;
	const modeList = modes.split(",");
	const current = global[modes as SchemaKey] as SchemaElement;

	if (typeof current === "string") continue;

	for (const keymap in current) {
		const currentKeymap = current[keymap as keyof typeof current];
		vim.keymap.set(
			modeList,
			keymap,
			currentKeymap[1],
			Object.assign({ desc: currentKeymap[2] }, currentKeymap[3] || {}),
		);
	}
}
