---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "gruvbox",
	theme_toggle = { "gruvbox", "gruvbox" },
	transparency = false,

	hl_override = highlights.override,
	hl_add = highlights.add,

	lsp = {
		-- show function signatures i.e args as you type
		signature = {
			disabled = true,
		},
	},

	tabufline = {
		-- show_numbers = false,
		-- enabled = true,
		lazyload = false,
		-- overriden_modules = nil,
	},

	statusline = {
		theme = "vscode",
		separator_style = "block",
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
