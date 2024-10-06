-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",

	 hl_override = {
      CursorLine = {bg = "#3c3836"}
	 },
}

M.ui = {

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
return M
