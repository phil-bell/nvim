return {
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
}
