return {
  -- 1. Add the Gruvbox plugin
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Make sure it loads first
    opts = {
      transparent_mode = true, -- Set to true if you want your terminal background to show through
      contrast = "hard", -- "hard", "soft" or empty for medium
      overrides = {
        -- You can fine-tune specific colors here if needed
      },
    },
  },

  -- 2. Force LazyVim to load Gruvbox on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
