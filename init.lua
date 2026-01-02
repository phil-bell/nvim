-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("kraken").setup()
--require("mason").setup()
--require("mason-lspconfig").setup({
--  ensure_installed = { "pyrefly" },
--})
local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
local harpoon_files = require("harpoon_files")
local icons = LazyVim.config.icons
require("lualine").setup({
  sections = {
    lualine_c = {
      LazyVim.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path({ length = 10 }) },
      harpoon_files.lualine_component,
    },
  },
})
