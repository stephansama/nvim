--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____zod = require("scripts.zod")
local z = ____zod.z
____exports.languageSchema = z:object({
    mason = z:string():array():meta({description = "https://mason-registry.dev/registry/list"}),
    servers = z:string():array():meta({description = "https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md"}),
    treesitter = z:string():array():meta({description = "https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages"}),
    linters = z:record(
        z:string(),
        z:string():array()
    ):meta({description = "https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters"}),
    formatters = z:record(
        z:string(),
        z:string():array()
    ):meta({description = "https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters"}),
    treesitter_parser = z:record(
        z:string(),
        z:object({
            filetype = z:string(),
            install_info = z:object({
                url = z:string(),
                files = z:string():array(),
                branch = z:string()
            })
        })
    )
})
____exports.languagePackSchema = z:record(
    z:string(),
    ____exports.languageSchema
)
return ____exports
