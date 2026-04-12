import * as global from "./global.json";
import * as plugin from "./plugin.json";

type Schema = Omit<typeof global, "$schema">;
type SchemaKey = keyof Schema;
type SchemaElement = Schema[SchemaKey];
type SchemaElementKey = keyof SchemaElement;

function isSchemaElementKey(key: string): key is SchemaElementKey {
	return !!key;
}

function isSchemaKey(key: string): key is SchemaKey {
	return key in global;
}

for (const modes in global) {
	if (modes === "$schema") continue;

	if (!isSchemaKey(modes)) {
		throw new Error("unable to find mode");
	}

	const modeList = modes.split(",");
	const current = global[modes as SchemaKey] as SchemaElement;

	if (typeof current === "string") continue;

	for (const keymap in current) {
		if (!isSchemaElementKey(keymap)) {
			throw new Error("unable to get keymap");
		}
		const currentKeymap = current[keymap];

		vim.keymap.set(
			modeList,
			keymap,
			currentKeymap[1],
			Object.assign(
				{ desc: currentKeymap[2] },
				typeof currentKeymap[3] === "object" ? currentKeymap[3] : {},
			),
		);
	}
}

for (const key in plugin) {
	if (key === "$schema") continue;
	const current = plugin[key as keyof typeof plugin];
	for (const map of current as [
		string,
		string,
		{ desc: string; modes: string },
	][]) {
		const modes = map[2]?.modes?.split(",") || "n";
		vim.keymap.set(modes, map[0], map[1], {
			desc: map[2]?.desc || "",
		});
	}
}
