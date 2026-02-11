-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>fC", function()
  local path = vim.fn.expand("%:p") --[[@as string]]

  if path == "" then
    return ""
  end

  path = LazyVim.norm(path)
  local root = LazyVim.root.get({ normalize = true })
  local cwd = LazyVim.root.cwd()
  local norm_path = path

  if norm_path:find(cwd, 1, true) == 1 then
    path = path:sub(#cwd + 2)
  elseif norm_path:find(root, 1, true) == 1 then
    path = path:sub(#root + 2)
  end

  vim.fn.setreg("+", path)
end, { desc = "Copy relative path" })

map("n", "<leader>tc", function()
  local path = vim.fn.expand("%:p") --[[@as string]]

  if path == "" then
    return ""
  end

  path = LazyVim.norm(path)
  local root = LazyVim.root.get({ normalize = true })
  local cwd = LazyVim.root.cwd()
  local norm_path = path

  if norm_path:find(cwd, 1, true) == 1 then
    path = path:sub(#cwd + 2)
  elseif norm_path:find(root, 1, true) == 1 then
    path = path:sub(#root + 2)
  end
  local func = vim.fn.expand("<cword>")

  vim.fn.setreg("+", "inv localdev.pytest " .. path .. " -- -k " .. func)
end, { desc = "Copy relative path" })
