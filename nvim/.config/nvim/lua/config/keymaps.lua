vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete character without yanking" })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Keep last yanked when pasting" })

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up and center" })

-- Find and center
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Find next and center" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Find previous and center" })

vim.keymap.set("n", "<leader>uz", require("zen-mode").toggle, { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
