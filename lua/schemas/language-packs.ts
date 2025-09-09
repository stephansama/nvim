import z from "zod";

const languageSchema = z.object({
	formatters: z.record(z.string(), z.string().array()).meta({
		description:
			"https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters",
	}),
	linters: z.record(z.string(), z.string().array()).meta({
		description:
			"https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters",
	}),
	mason: z
		.string()
		.array()
		.meta({ description: "https://mason-registry.dev/registry/list" }),
	mason_registries: z
		.string()
		.array()
		.meta({ description: "List of mason registries to use" }),
	servers: z.string().array().meta({
		description:
			"https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md",
	}),
	treesitter: z.string().array().meta({
		description:
			"https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages",
	}),
	treesitter_parser: z.record(
		z.string(),
		z.object({
			filetype: z.string(),
			install_info: z.object({
				url: z.string(),
				files: z.string().array(),
				branch: z.string(),
			}),
		}),
	),
});

export const languagePackSchema = z.record(z.string(), languageSchema);

export type Schema = z.infer<typeof languageSchema>;
