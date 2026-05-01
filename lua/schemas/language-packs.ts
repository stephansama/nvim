import * as z from "zod";

const languageSchema = z.object({
	formatters: z.record(z.string(), z.array(z.string().trim())).meta({
		description:
			"https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters",
	}),
	linters: z.record(z.string(), z.array(z.string().trim())).meta({
		description:
			"https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters",
	}),
	mason: z
		.array(z.string().trim())
		.meta({ description: "https://mason-registry.dev/registry/list" }),
	mason_registries: z
		.array(z.string().trim())
		.meta({ description: "List of mason registries to use" }),
	servers: z.array(z.string().trim()).meta({
		description:
			"https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md",
	}),
	treesitter: z.array(z.string().trim()).meta({
		description:
			"https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages",
	}),
	treesitter_parser: z.record(
		z.string(),
		z.object({
			filetype: z.string().trim(),
			install_info: z.object({
				branch: z.string().trim(),
				files: z.array(z.string().trim()),
				url: z.string().trim(),
			}),
		}),
	),
});

export const languagePackSchema = z.record(z.string(), languageSchema);

export type Schema = z.infer<typeof languageSchema>;
