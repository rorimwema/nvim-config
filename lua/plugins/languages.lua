return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {},
        rust_analyzer = {},
        hls = {},
        clangd = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "ocaml",
        "ocaml_interface",
        "rust",
        "haskell",
        "c",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ocamllsp",
        "rust-analyzer",
        "haskell-language-server",
        "clangd",
      },
    },
  },
}
