-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
-- Set to "ruff_lsp" to use the old LSP implementation version.

vim.g.lazyvim_python_lsp = "pyright"
vim.env.PYTHONPATH = "/Users/philip.bell/projects/kraken-core/src"
vim.g.test_cmd = { "-p tools.pytest.django_config_auto_selection.plugin", "-vvv" }
vim.g.lazyvim_python_ruff = "ruff"
