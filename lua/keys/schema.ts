import { z } from "zod";

const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;
type MODE = (typeof MODES)[number];

export type TWO_MODES = `${MODE},${MODE}`;
export type THREE_MODES = `${MODE},${MODE},${MODE}`;
export type MODE_OPTION = MODE | TWO_MODES | THREE_MODES;

export type KeyMap = Record<MODE_OPTION, string>;

export const keymapSchema = z.object({});

const pluginMapSchema = z.tuple([
	z.string(),
	z.string(),
	z.object({
		buffer: z.number().or(z.boolean()),
		desc: z.string(),
		expr: z.boolean(),
		remap: z.boolean(),
		silent: z.boolean(),
	}),
]);

export const pluginSchema = z.record(z.string(), pluginMapSchema);
