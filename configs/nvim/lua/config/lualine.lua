local function location_with_unicode()
	local line = vim.fn.line(".")
	local col = vim.fn.virtcol(".")
	local currentLine = vim.api.nvim_get_current_line() or ""
	local currentChar = string.format("U+%04X", string.byte(currentLine:sub(col, col))) or ""
	-- will be display 5:5 U+006
	return string.format("%3d:%d %s", line, col, currentChar)
end

local opts = {
	options = {
		theme = "edge",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = { "lsp_progress" },
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{
				location_with_unicode,
				separator = { right = "" },
				left_padding = 2,
			},
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
}

require("lualine").setup(opts)

local colors = require("config.colors").get_palette()
table.insert(opts, {
	"lsp_progress",
	-- With spinner
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
	colors = {
		--   percentage      = colors.cyan,
		title = colors.cyan,
		--   message         = colors.cyan,
		--   spinner         = colors.cyan,
		--   lsp_client_name = colors.magenta,
		--   use             = true,
	},
	separators = {
		component = " ",
		progress = " | ",
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "[", post = "]" },
		spinner = { pre = "", post = "" },
		message = { commenced = "In Progress", completed = "Completed" },
	},
	display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
})
