# My LazyVim Configuration

Personal Neovim configuration powered by [LazyVim](https://github.com/LazyVim/LazyVim).

## Languages

| Language | LSP | Formatter | Linter | Testing |
|----------|-----|-----------|--------|---------|
| Python | pyright | black | ruff, mypy | neotest-python |
| OCaml | ocamllsp | ocamlformat | - | - |
| Rust | rust-analyzer | rustfmt | clippy | neotest-rust |
| Haskell | haskell-language-server | fourmolu | hlint | neotest-haskell |
| C/C++ | clangd | clang-format | - | neotest-ctest |
| Elm | elmls | elm-format | - | - |

## Tools

### Debugging (nvim-dap)
- `db` - Toggle breakpoint
- `dB` - Conditional breakpoint
- `dc` - Continue/run
- `di` - Step into
- `do` - Step out
- `dO` - Step over
- `dr` - Toggle REPL
- `dw` - Widgets/hover
- `dC` - Run to cursor

### Testing (neotest)
- `tt` - Run file tests
- `tT` - Run all tests
- `tr` - Run nearest test
- `ts` - Toggle summary
- `to` - Show output
- `td` - Debug nearest test

### Rust
- `<leader>cR` - Code actions
- `<leader>dr` - Debuggables

## Installation

```bash
git clone https://github.com/rorimwema/nvim-config.git ~/.config/nvim
nvim  # Lazy will auto-install plugins
```

## Structure

| Path | Purpose |
|------|---------|
| `lua/config/lazy.lua` | Plugin manager bootstrap |
| `lua/plugins/languages.lua` | Language servers, tools, testing |
| `lua/plugins/colorscheme.lua` | Colorscheme configuration |
| `lua/config/` | Core options, keymaps, autocmds |
| `lazy-lock.json` | Pinned plugin versions |

## AI/ML Workflow

For GraphRAG, PyTorch GNN, and AI development:

1. **Debug PyTorch tensors**: Use `d*` keybindings with nvim-dap
2. **Run tests**: Use `t*` keybindings with neotest
3. **Virtual environments**: Activate in terminal before opening nvim

## Mason Tools Installed

```
LSP: ocamllsp, rust-analyzer, hls, clangd, pyright, elmls
Formatter: black, ruff, rustfmt, ocamlformat, clang-format, elm-format
Linter: ruff, mypy, shellcheck, hlint
Debug: debugpy, codelldb
Other: lua-language-server
```
