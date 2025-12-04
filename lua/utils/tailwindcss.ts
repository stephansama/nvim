export function getLocalTailwindSettings(this: void) {
	const vscodeSettingsPath = ".vscode/settings.json";

	if (vim.fn.filereadable(vscodeSettingsPath) !== 1) return {};

	const file = vim.fn.readfile(vscodeSettingsPath) as string[];

	const vscodeSettings = safeDecode(table.concat(file));

	if (vscodeSettings === false) {
		vim.print(
			"Failed to load '.vscode/settings.json': invalid JSON syntax.",
		);
		return {};
	}

	const twSettings: { tailwindCSS?: unknown } = {};

	for (const [key, value] of Object.entries(vscodeSettings)) {
		if (!key.startsWith("tailwindCSS")) continue;

		// eslint-disable-next-line
		let current: Record<string, any> = twSettings;
		const sections = key.split(".");

		for (let i = 0; i < sections.length; i++) {
			const section = sections[i];
			const isLast = i === sections.length - 1;

			current[section] = isLast
				? transformValue(key, value)
				: current[section] || {};

			if (!isLast) {
				current = current[section];
			}
		}
	}

	return twSettings.tailwindCSS || {};
}

function safeDecode(this: void, str: string) {
	try {
		return vim.json.decode(str);
	} catch {
		return false;
	}
}

function transformValue(
	this: void,
	key: string,
	value: string | Record<string, string>,
	transform = (str: string) => `${vim.fn.getcwd()}/${str}`,
) {
	if (!key.endsWith("configFile")) return value;

	if (typeof value === "string") return transform(value);

	const transformed: Record<string, string> = {};

	for (const [currKey, curr] of Object.entries(value)) {
		transformed[transform(currKey)] = transform(curr);
	}

	return transformed;
}
