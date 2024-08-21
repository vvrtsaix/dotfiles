return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_z = {
        {
          function()
            local bufnr = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_clients({ bufnr })
            if next(clients) == nil then
              return "LSP"
            end
            local c = {}
            for _, client in pairs(clients) do
              if client.name ~= "copilot" then
                table.insert(c, client.name)
              end
            end
            if #c == 0 then
              return "LSP"
            end
            return table.concat(c, ",")
          end,
          separator = { right = "" },
          left_padding = 2,
        },
      },
    },
  },
}
