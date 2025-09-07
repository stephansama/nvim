<!-- markdownlint-disable RULE33 MD033 MD041 -->

<div align="center">

# [`@stephansama`](https://github.com/stephansama/stephansama) nvim

[![Lua](https://img.shields.io/badge/Lua-5.1-2C2D72.svg?logo=lua&logoColor=white&labelColor=2C2D72)](https://github.com/search?q=repo%3Astephansama%2Fnvim%20language%3Alua&type=code)
[![LazyVim](https://img.shields.io/badge/LazyVim-2E7DE9.svg?logo=lazyvim&logoColor=white)](https://www.lazyvim.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.8.2-3178C6.svg?logo=typescript&logoColor=white&labelColor=3178C6)](https://github.com/search?q=repo%3Astephansama%2Fnvim%20language%3ATypeScript&type=code)
[![Zod](https://img.shields.io/badge/Zod-4.1.5-408AFF.svg?logo=zod&logoColor=white&labelColor=408AFF)](https://zod.dev/)

</div>

![Screenshot](https://i.imgur.com/RrehNix.png)

[Article explaining neovim config](https://madprofessorblog.org/articles/my-neovim-config/)

[interactive bundle visualization](https://files.stephansama.info/configs/neovim)

_bundle visualization generated using [bloat.nvim](https://github.com/dundalek/bloat.nvim) and [Esbuild analyzer](https://esbuild.github.io/analyze/)_

## ⚙️ Installation

Install directly to neovim config with the following command

```sh
git clone https://github.com/stephansama/nvim ~/.config/nvim
```

or install to a specific folder and invoke the config with the following command

```sh
git clone https://github.com/stephansama/nvim ~/.config/stephansamanvim

# then launch neovim with the newly downloaded configuration
NVIM_APPNAME=stephansamanvim nvim
```

## ✨ Features

This Neovim configuration is built to be a highly customized and efficient development environment. Here are some of the key features:

- **📦 Plugin Management**: Uses [`lazy.nvim`](https://github.com/folke/lazy.nvim) for declarative and optimized plugin management, ensuring fast startup times.
- **📝 Schema-Driven Configuration**: Leverages TypeScript and [`zod`](https://zod.dev/) to create and enforce schemas for configuration files like key mappings and dashboard shortcuts. This provides strong typing and validation for what would otherwise be plain JSON or Lua tables.
- **Lua Type-Checking**: Utilizes [`tstl`](https://github.com/TypeScriptToLua/TypeScriptToLua) to generate Lua from TypeScript, enabling robust type-checking and autocompletion for the Lua configuration within the editor.
- **🧩 Modular Structure**: The configuration is broken down into logical modules for plugins, LSP settings, key mappings, and utilities, making it easy to manage and extend.
- **🚀 Built-in Tooling**: Includes scripts for building schemas, syncing snippets, and other automation tasks, managed via `pnpm` and a `Makefile`.

## 📁 File structure

```mermaid
graph TD
    A["nvim/"] --> N[".husky/"];
    A --> O["ftplugin/"];
    A --> P["images/"];
    A --> Q["lsp/"];
    A --> R["lua/"];
    A --> T["snippets/"];

    subgraph lua
        R --> R1["config/"];
        R --> R2["icons/"];
        R --> R3["keys/"];
        R --> R4["plugins/"];
        R --> R5["schemas/"];
        R --> R6["utils/"];
    end

    subgraph plugins
        R4 --> R4_1["debug/"];
        R4 --> R4_2["editor/"];
        R4 --> R4_3["lang/"];
        R4 --> R4_4["test/"];
        R4 --> R4_5["ui/"];
    end
```
