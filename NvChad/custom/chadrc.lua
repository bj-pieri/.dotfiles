local M = {}

local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

M.options = {
  user = function ()
    vim.opt.relativenumber = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_antialiasing = true
  end
}


M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "block",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["nvim-telescope/telescope.nvim"] = override.telescope,
      ["feline-nvim/feline.nvim"] = override.feline,
   },

   user = userPlugins,
}

M.ui = {
   theme = "gruvbox",
}

M.mappings = require "custom.mappings"

return M
