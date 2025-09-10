import { ASCII_DIR } from "@/config/constants";

export function loadAscii(this: void) {
	math.randomseed(os.time());

	const collected = [];
	const filenames = vim.fn.readdir(ASCII_DIR);

	if (filenames.length === 0) return [];
	for (const filename of filenames) {
		const fullPath = ASCII_DIR + filename;
		if (vim.fn.filereadable(fullPath) === 1) {
			collected.push(fullPath);
		}
	}

	const random = math.random(collected.length);
	const picked = collected[random - 1];

	if (!picked) {
		return vim.print("failed to pick file (no file picked)");
	}

	return vim.fn.readfile(picked);
}
