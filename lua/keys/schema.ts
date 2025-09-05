import z from "zod";
import * as allModes from "./modes.json";

const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;

const rhsSchema = z.object({
	buffer: z.number().or(z.boolean()),
	desc: z.string(),
	expr: z.boolean(),
	mode: z.enum(MODES),
	remap: z.boolean(),
	silent: z.boolean(),
});

const pluginKeymapConfigSchema = z.tuple([
	z.string().describe("keymap"),
	z.string().describe("action"),
	rhsSchema.optional(),
]);

export const pluginKeymapSchema = z.record(
	z.string(),
	pluginKeymapConfigSchema.array(),
);

const globalKeymapConfigSchema = z.tuple([
	z.string().describe("action"),
	z.string().describe("description"),
	rhsSchema.optional(),
]);

export type GlobalKeymapConfig = z.infer<typeof globalKeymapConfigSchema>;

export const globalKeymapSchema = z.record(
	z.enum(allModes),
	z.record(z.string().describe("keymap"), globalKeymapConfigSchema),
);
