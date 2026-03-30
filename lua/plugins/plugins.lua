return {
  {
    "ohakutsu/socks-copypath.nvim",
    config = function()
      require("socks-copypath").setup()
    end,
  },
  { "bufferline.nvim", enabled = false },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "kiennt63/harpoon-files.nvim",
    dependencies = {
      { "ThePrimeagen/harpoon", branch = "harpoon2" },
    },
  },
  {
    "octoenergy/kraken.nvim",
    opts = { commands = {} },
    dev = true,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = true, django = true },
            args = { "-p tools.pytest.django_config_auto_selection.plugin", "-vvv" },
          }),
        },
        output = { open_on_run = true },
        discovery = {
          enabled = false,
          concurrent = 1,
        },
        summary = {
          animated = false,
        },
      })
    end,
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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
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
      },
    },
  },
}
