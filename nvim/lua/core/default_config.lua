-- IMPORTANT NOTE : This is default config, so dont change anything here.
-- customrc overrides this file

local M = {}

M.options = {

   -- load your options here or load module with options1
   user = function() end,

}

---- UI -----

M.ui = {
   hl_override = {},
   changed_themes = {},
   colors = "", -- path of your file that contains colors
   theme = "gruvbox", -- default theme
   transparency = false,
}

M.plugins = {
   override = {},
   remove = {},

   options = {
      packer = {
         init_file = "plugins.packerInit",
         snapshot = nil,
      },
      lspconfig = {
         setup_lspconf = "", -- path of lspconfig file
      },
      statusline = {
         separator_style = "block", -- default/round/slant/block/arrow
      },
   },

   -- add, modify, remove plugins
   user = {},
}

-- non plugin only
M.mappings = {
   misc = function() end,
}

return M
