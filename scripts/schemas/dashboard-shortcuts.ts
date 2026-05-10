import * as z from "zod";

/** @see https://github.com/nvimdev/dashboard-nvim?tab=readme-ov-file#example-config */

const dashboardShortcutsSchema = z.object({
	action: z.string().trim().optional(),
	desc: z.string().trim().optional(),
	group: z.string().trim().optional(),
	icon: z.string().trim().optional(),
	icon_hl: z.string().trim().optional(),
	key: z.string().trim().optional(),
});

export const shortcutsSchema = z.object({
	shortcuts: dashboardShortcutsSchema.array(),
});
