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
    -- lualine_c = {
    --   LazyVim.lualine.root_dir(),
    --   {
    --     "diagnostics",
    --     symbols = {
    --       error = icons.diagnostics.Error,
    --       warn = icons.diagnostics.Warn,
    --       info = icons.diagnostics.Info,
    --       hint = icons.diagnostics.Hint,
    --     },
    --   },
    --   { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
    --   { LazyVim.lualine.pretty_path({ length = 10 }) },
    -- },
    lualine_x = {
      harpoon_files.lualine_component,
      Snacks.profiler.status(),
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = function() return { fg = Snacks.util.color("Statement") } end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { fg = Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { fg = Snacks.util.color("Debug") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = Snacks.util.color("Special") } end,
        },
      {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },
  },
})
