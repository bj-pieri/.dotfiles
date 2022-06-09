local M = {}

local override = require "custom.override"

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
   },

   user = require "custom.plugins",

   remove = {
      "folke/which-key.nvim",
   },

}

M.ui = {
   theme = "gruvbox",
   transparency = false,
   theme_toggle = { "gruvbox", "gruvbox_light" },
}

M.mappings = require "custom.mappings"

return M
