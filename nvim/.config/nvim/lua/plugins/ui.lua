-- UI: colorscheme and appearance
return {
  -- no indent guides, no animations, instant scrolling
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      animate = { enabled = false },
      scroll = { enabled = false },
      zen = { toggles = { dim = false } },
    },
  },

  -- classic which-key popup instead of the helix-style default
  {
    "folke/which-key.nvim",
    opts = { preset = "modern" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "latte",
      term_colors = true,
      no_italic = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },

  -- bubbles-style statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              local names = vim.tbl_map(function(c)
                return c.name
              end, vim.lsp.get_clients({ bufnr = 0 }))
              return #names > 0 and table.concat(names, ",") or "NOLSP"
            end,
            separator = { right = "" },
          },
        },
      },
    },
  },
}
