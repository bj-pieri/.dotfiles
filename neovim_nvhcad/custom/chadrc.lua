-- IMPORTANT NOTE : This is default config, so dont change anything here.
-- chadrc overrides this file

local M = {}

local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"

M.options = {

   -- load your options here or load module with options1
   user = function() 
     vim.opt.relativenumber = true
   end,

   nvChad = {
      -- updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}

---- UI -----

M.ui = {
   hl_override = "",
   colors = "", -- path of your file that contains colors
   theme = "gruvbox", -- default theme
   transparency = true,
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
         setup_lspconf = "custom.plugins.lspconfig", -- path of lspconfig file
      },
      statusline = {
         separator_style = "block", -- default/round/slant/block/arrow
      },
   },

   -- add, modify, remove plugins
   user = userPlugins,
}

-- non plugin only
M.mappings = {
   misc = function() end,
}

return M
