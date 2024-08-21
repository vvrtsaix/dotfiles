return {
  "folke/zen-mode.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 200,
      height = 1,
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      todo = { enabled = false },
      kitty = {
        enabled = false,
        font = "+4",
      },
    },
  },
}
