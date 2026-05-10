import * as z from "zod";

import { ALL_MODES, MODES } from "./modes";

const rhsSchema = z.object({
	buffer: z.number().or(z.boolean()),
	desc: z.string().trim(),
	expr: z.boolean(),
	mode: z.enum(MODES),
	remap: z.boolean(),
	silent: z.boolean(),
});

const pluginKeymapConfigSchema = z.tuple([
	z.string().trim().meta({ description: "keymap" }),
	z.string().trim().meta({ description: "action" }),
	rhsSchema.optional(),
]);

export const pluginKeymapSchema = z.record(
	z.string(),
	pluginKeymapConfigSchema.array(),
);

const globalKeymapConfigSchema = z.tuple([
	z.string().trim().meta({ description: "action" }),
	z.string().trim().meta({ description: "description" }),
	rhsSchema.optional(),
]);

export type GlobalKeymapConfig = z.infer<typeof globalKeymapConfigSchema>;

export const globalKeymapSchema = z.record(
	z.enum(ALL_MODES),
	z.record(
		z.string().meta({ description: "keymap" }),
		globalKeymapConfigSchema,
	),
);
