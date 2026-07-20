return {
  { "bufferline.nvim", enabled = false },
  {
    "octoenergy/kraken.nvim",
    opts = { commands = {} },
    dev = true,
  },
  {
    {
      "folke/noice.nvim",
      opts = {
        cmdline = {
          view = "cmdline",
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        sql = { "sql_formatter" },
      },
    },
  },
  {
    "gregorias/coerce.nvim",
    tag = "v4.2.1",
    config = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
