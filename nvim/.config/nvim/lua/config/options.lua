-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use intelephense instead of phpactor for the lang.php extra
vim.g.lazyvim_php_lsp = "intelephense"

-- Disable format-on-save (format manually with <leader>cf, re-enable with <leader>uf)
vim.g.autoformat = false

-- No animations (global snacks toggle), no current-line highlight
vim.g.snacks_animate = false
vim.opt.cursorline = false
