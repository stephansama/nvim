import z from "zod";

const dashboardShortcutsSchema = z.object({
	key: z.string().optional(),
	icon: z.string().optional(),
	desc: z.string().optional(),
	group: z.string().optional(),
	action: z.string().optional(),
	icon_hl: z.string().optional(),
});

export const shortcutsSchema = z.object({
	shortcuts: dashboardShortcutsSchema.array(),
});
