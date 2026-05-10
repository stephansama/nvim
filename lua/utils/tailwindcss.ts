export function getLocalTailwindSettings(this: void) {
	const vscodeSettingsPath = ".vscode/settings.json";

	if (vim.fn.filereadable(vscodeSettingsPath) !== 1) return {};

	const file = vim.fn.readfile(vscodeSettingsPath) as string[];

	const vscodeSettings = safeDecode<{ tailwindCSS: Record<string, string> }>(
		// eslint-disable-next-line unicorn/prefer-spread
		table.concat(file),
	);

	if (vscodeSettings === false) {
		vim.print(
			"Failed to load '.vscode/settings.json': invalid JSON syntax.",
		);
		return {};
	}

	const twSettings: {
		[key: string]: Record<string, string> | string;
	} = {};

	for (const [key, value] of Object.entries(vscodeSettings)) {
		if (!key.startsWith("tailwindCSS")) continue;

		let current = twSettings;
		const sections = key.split(".");

		for (let index = 0; index < sections.length; index++) {
			const section = sections[index];
			const isLast = index === sections.length - 1;

			current[section] = isLast
				? transformValue(key, value)
				: current[section] || {};

			if (!isLast) {
				// @ts-expect-error dont wanna fix rn
				current = current[section];
			}
		}
	}

	return twSettings.tailwindCSS || {};
}

function safeDecode<T = object>(this: void, string_: string) {
	try {
		return vim.json.decode(string_) as T;
	} catch {
		return false;
	}
}

function transformValue(
	this: void,
	key: string,
	value: Record<string, string> | string,
	transform = (string_: string) => `${vim.fn.getcwd()}/${string_}`,
) {
	if (!key.endsWith("configFile")) return value;

	if (typeof value === "string") return transform(value);

	const transformed: Record<string, string> = {};

	for (const [currentKey, current] of Object.entries(value)) {
		transformed[transform(currentKey)] = transform(current);
	}

	return transformed;
}
