return {
	"nvimdev/dashboard-nvim",
	opts = function(_, opts)
		local logo = [[
                                                                             
               ████ ██████           █████      ██                     
              ███████████             █████                             
              █████████ ███████████████████ ███   ███████████   
             █████████  ███    █████████████ █████ ██████████████   
            █████████ ██████████ █████████ █████ █████ ████ █████   
          ███████████ ███    ███ █████████ █████ █████ ████ █████  
         ██████  █████████████████████ ████ █████ █████ ████ ██████ 
      ]]

		opts.theme = "hyper"
		opts.config.header = vim.split(logo .. "\n", "\n")
		opts.config.footer = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return { "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
		end
		opts.config.packages = { enable = false }
		opts.config.shortcut = {
			{ action = "ene | startinsert", desc = "new", icon = " ", key = "n" },
			{ action = 'lua LazyVim.pick("oldfiles")()', desc = "recent", icon = " ", group = "Label", key = "r" },
			{
				action = 'lua require("persistence").load()',
				desc = "restore",
				icon = " ",
				group = "DiagnosticHint",
				key = "s",
			},
			{ action = "LazyExtras", desc = "extra", icon = " ", key = "x" },
			{ action = "Lazy", desc = "Lazy", icon = "󰒲 ", key = "l" },
			{
				action = function()
					vim.api.nvim_input("<cmd>qa<cr>")
				end,
				group = "Number",
				desc = "quit",
				icon = " ",
				key = "q",
			},
		}
	end,
}
