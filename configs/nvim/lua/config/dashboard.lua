local db = require("dashboard")

local theme_config = {
	header = {
		-- functional
		---- programming
		----- forever
		"                ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                ",
		"            ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░              ",
		"          ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒            ",
		"        ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓          ",
		"      ░▓███▓▒████████████░░░▒██████████▓░▓██▓        ",
		"     ▒████▒▓█████████████▓░░░▓███████████░▓███▒      ",
		"    ▒████▓▒███████████████░░░░████████████░████▒     ",
		"   ▒█████░███████████████▓░░░░▒███████████▒▒████▒    ",
		"  ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░   ",
		" ░██████▓▒██████████████▒▓███░░░▓██████████░██████░  ",
		" ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░  ",
		" ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒  ",
		" ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓  ",
		" ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒  ",
		" ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░  ",
		" ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░  ",
		"  ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░   ",
		"  ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒    ",
		"   ░▒██████████████████▓░░░░███████████████████▒     ",
		"     ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░      ",
		"      ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒        ",
		"        ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒          ",
		"           ░▓███████▒▓▒▒░░░░░▒▓████████▓▒            ",
		"              ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░               ",
		"                      ▒▒▒▓▓▓▒▒                       ",
		"                                                     ",
	},
	center = {
		{ icon = " ", desc = "Taking Notes (Norg)       SPC n n", action = "Telescope neorg switch_workspace" },
		{ icon = " ", desc = "Find File                 SPC f f", action = "Telescope find_files" },
		{ icon = " ", desc = "Recents                   SPC f o", action = "Telescope oldfiles" },
		{ icon = " ", desc = "Find Word                 SPC f w", action = "Telescope live_grep" },
		{ icon = "洛", desc = "New File                  SPC f n", action = "DashboardNewFile" },
		{ icon = " ", desc = "Bookmarks                 SPC b m", action = "Telescope marks" },
		{ icon = " ", desc = "Load Last Session         SPC l  ", action = "SessionLoad" },
		-- { icon = ' ', desc = "Open Calendar             SPC g c", action = "Calendar" },
		-- { icon = '☑ ', desc = "Find Project Task         SPC f t", action = "lua require('settings').fun.search_tasks()" },
	},
	-- FIXME
	-- footer = function()
	--   local ls = require("lazy").stats()
	--   return {
	--     icon = "",
	--     desc = string.format("🚀 Loaded [%d / %d] plugins. 🎉", ls.loaded, ls.count),
	--   }
	-- end,
}

local dashboard_config = {
	theme = "hyper",
	hide = {
		statusline = true,
		tabline = true,
		winbar = true,
	},
	config = theme_config,
}

db.setup(dashboard_config)

-- see https://github.com/nvimdev/dbsession.nvim
-- db.session_directory = "~/.session_dashboard.nvim"
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "DBSessionSavePre",
--   callback = function()
--     pcall(vim.cmd, "NvimTreeClose")
--   end,
-- })
