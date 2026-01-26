return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {},
        rust_analyzer = {},
        hls = {},
        clangd = {},
        pyright = {},
        elmls = {},
        tinymist = {},
        ty = {},
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
        "python",
        "elm",
        "typst",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ocaml-lsp",
        "rust-analyzer",
        "haskell-language-server",
        "clangd",
        "pyright",
        "debugpy",
        "elm-language-server",
        "tinymist",
        "black",
        "ruff",
        "mypy",
        "codelldb",
        "lua-language-server",
        "shellcheck",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ocaml = { "ocamlformat" },
      },

      formatters = {
        ocamlformat = {
          prepend_args = {
            "--if-then-else",
            "vertical",
            "--break-cases",
            "fit-or-vertical",
            "--type-decl",
            "sparse",
          },
        },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            diagnostics = {
              enable = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
    },
  },
  {
    "mrcjkb/haskell-tools.nvim",
    ft = { "haskell", "lhaskell" },
    version = "^3",
    config = function()
      vim.g.haskell_tools = {}
    end,
  },
  {
    "tarides/ocaml.nvim",
    ft = { "ocaml", "ocaml.menhir", "ocaml.interface", "reason", "dune" },
    config = function()
      require("ocaml").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      {
        "dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "dc",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    opts = {},
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {},
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          if LazyVim.has("trouble.nvim") then
            require("trouble").open({ mode = "quickfix", focus = false })
          else
            vim.cmd("copen")
          end
        end,
      },
    },
    keys = {
      { "t", "", desc = "+test" },
      {
        "tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File (Neotest)",
      },
      {
        "tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All (Neotest)",
      },
      {
        "tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest (Neotest)",
      },
      {
        "ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary (Neotest)",
      },
      {
        "to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output (Neotest)",
      },
      {
        "td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Nearest",
      },
    },
  },
  {
    "rouge8/neotest-rust",
    ft = { "rust" },
    dependencies = { "nvim-neotest/neotest" },
    opts = {
      args = { "--no-capture" },
      dap_adapter = "lldb",
    },
  },
  {
    "MrcJkb/neotest-haskell",
    ft = { "haskell", "lhaskell" },
    dependencies = { "nvim-neotest/neotest" },
  },
  {
    "orjangj/neotest-ctest",
    ft = { "c", "cpp" },
    dependencies = { "nvim-neotest/neotest" },
    opts = {},
  },
  {
    "nvim-neotest/neotest-python",
    ft = { "python" },
    dependencies = { "nvim-neotest/neotest" },
    opts = {
      dap = { justMyCode = false },
    },
  },
}
