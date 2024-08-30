return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		-- opts = {
		-- 	indent = {
		-- 		char = "",
		-- 		tab_char = "",
		-- 	},
		-- },
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				tab_size = 20,
				show_close_icon = false,
				show_buffer_close_icons = false,
				separator_style = { "", "" },
				indicator = { style = "none" },
			},
		},
	},
	{
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
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			window = {
				backdrop = 0.95,
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
	},
}
