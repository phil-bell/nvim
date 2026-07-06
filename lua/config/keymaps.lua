-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

function getPath()
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
  return path
end

-- Source - https://stackoverflow.com/a/7615129
-- Posted by user973713, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-05-28, License - CC BY-SA 4.0

function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

function getImport()
  local path = getPath()
  path = string.gsub(path, "/", ".")
  local split_path = split(path, ".")
  table.remove(split_path, 1)
  table.remove(split_path, nil)
  local file_name = split_path[#split_path]
  if string.sub(file_name, 1, 1) == "_" then
    table.remove(split_path, nil)
    file_name = split_path[#split_path]
  end
  local module_name = split_path[#split_path - 1] .. "_" .. split_path[#split_path]
  table.remove(split_path, nil)
  local import = "from " .. table.concat(split_path, ".") .. " import " .. file_name .. " as " .. module_name
  return import
end

map("n", "<leader>fC", function()
  local path = getPath()
  vim.fn.setreg("+", path)
end, { desc = "Copy relative path" })

map("n", "<leader>fi", function()
  local path = getImport()
  vim.fn.setreg("+", path)
end, { desc = "Copy relative import" })

map("n", "<leader>tc", function()
  local path = getPath()
  local func = vim.fn.expand("<cword>")

  vim.fn.setreg("+", "inv localdev.pytest " .. path .. " -- -k " .. func)
end, { desc = "Copy relative path" })

map("n", "<leader>kl", "<cmd>KLocateTests<cr>", { desc = "Locate test file" })
