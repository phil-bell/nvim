return {
  { "bufferline.nvim", enabled = false },
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  {
    "gregorias/coerce.nvim",
    tag = "v5.0.0",
    config = true,
    keys = {
      { "<leader>cc", "<Plug>(coerce-normal)", desc = "Coerce word" },
    },
  },
  {
    "octoenergy/kraken.nvim",
    dev = true,
    config = true,
    keys = {
      { "<leader>kl", "<cmd>KLocateTests<cr>", desc = "Locate test file" },
      { "<leader>ki", "<cmd>KPasteImportStatement<cr>", desc = "Paste import statement of other buffer" },
      {
        "<leader>ka",
        "<cmd>KPasteImportStatementWithAlias<cr>",
        desc = "Paste import statement of other buffer with alias",
      },
    },
  },
}
