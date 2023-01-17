local M = {}

M.ui = {
   theme = "gruvbox",
   transparency = false,
   theme_toggle = { "gruvbox", "gruvbox_material" },
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
