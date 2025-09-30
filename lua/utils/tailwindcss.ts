export function getLocalTailwindSettings() {
	const vscodeSettingsPath = ".vscode/settings.json";

	if (vim.fn.filereadable(vscodeSettingsPath) !== 1) return {};

	const file = vim.fn.readfile(vscodeSettingsPath) as string[];

	const vscodeSettings = vim.json.decode(table.concat(file));

	const twSettings = {};

	for (const [key, value] of Object.entries(vscodeSettings)) {
		if (!key.startsWith("tailwindCSS")) continue;

		const sections = key.split(".");
		let current: any = twSettings;

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

	return twSettings;
}

function transformValue(
	key: string,
	value: string | Record<string, string>,
	transform = (str: string) => `${vim.fn.getcwd()}/${str}`,
) {
	if (!key.endsWith("configFile")) return value;

	if (typeof value === "string") return transform(value);

	const transformed: Record<string, string> = {};

	for (const [key, curr] of Object.entries(value)) {
		transformed[key] = transform(curr);
	}

	return transformed;
}
