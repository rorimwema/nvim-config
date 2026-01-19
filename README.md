# My LazyVim Configuration

Personal Neovim configuration powered by [LazyVim](https://github.com/LazyVim/LazyVim).

## Features

### Languages
| Language | LSP | Formatter | Linter | Testing |
|----------|-----|-----------|--------|---------|
| Python | pyright | black | ruff, mypy | neotest-python |
| OCaml | ocamllsp | ocamlformat | - | - |
| Rust | rust-analyzer | rustfmt | clippy | neotest-rust |
| Haskell | haskell-language-server | fourmolu | hlint | neotest-haskell |
| C/C++ | clangd | clang-format | - | neotest-ctest |
| Elm | elmls | elm-format | - | - |

### Development Tools
- **Debugging**: nvim-dap with UI, virtual text
- **AI Coding**: CopilotChat (`:CopilotChat`)
- **Testing**: neotest with adapters for Python, Rust, Haskell, C/C++
- **Productivity**: crates.nvim for Rust dependencies

### Keybindings

| Key | Description |
|-----|-------------|
| `<leader>cc` | Open CopilotChat |
| `<leader>cR` | Rust code actions |
| `<leader>dr` | Rust debuggables |
| `d*` | DAP commands (db, dc, di, do, etc.) |
| `t*` | Test commands (tt, tr, ts, td, etc.) |

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

## AI/ML Workflow

For GraphRAG, PyTorch GNN, and AI development:

1. **Debugging PyTorch tensors**: Use `d*` keybindings to debug with nvim-dap
2. **Running tests**: Use `t*` keybindings with neotest
3. **AI assistance**: Use `<leader>cc` for CopilotChat conversations

## Python Virtual Environments

For ML projects, ensure your virtual environment is activated in the terminal before opening neovim, or set `python3.path` in your lspconfig.
