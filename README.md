# My LazyVim Configuration

Personal Neovim configuration powered by [LazyVim](https://github.com/LazyVim/LazyVim).

## Features

- **Languages**: OCaml, Rust, Haskell, C/C++
- **LSP**: ocamllsp, rust-analyzer, haskell-language-server, clangd
- **Debugging**: nvim-dap with UI support
- **Testing**: neotest with adapters for Rust, Haskell, and C/C++
- **Productivity**: crates.nvim for Rust dependency management

## Installation

Clone and use as your neovim config:

```bash
git clone https://github.com/rorimwema/nvim-config.git ~/.config/nvim
```

On first launch, lazy will auto-install all plugins.

## How It Works

- **lua/config/lazy.lua** - Plugin manager bootstrap
- **lua/plugins/** - Plugin specifications
- **lua/config/** - Core configuration (options, keymaps, autocmds)
- **lazy-lock.json** - Pinned plugin versions

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Configuration follows LazyVim patterns with custom overrides in `lua/plugins/`.
