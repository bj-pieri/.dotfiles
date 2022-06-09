local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local plugins = {
   ["nvim-lua/plenary.nvim"] = {},
   ["lewis6991/impatient.nvim"] = {},

   ["wbthomason/packer.nvim"] = {
      event = "VimEnter",
   },

   ["kyazdani42/nvim-web-devicons"] = {
      config = function()
         require "plugins.configs.icons"
      end,
   },

   ["feline-nvim/feline.nvim"] = {
      after = "nvim-web-devicons",
      config = function()
         require "plugins.configs.statusline"
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      after = "nvim-web-devicons",
      config = function()
         require "plugins.configs.bufferline"
      end,
   },

   ["lukas-reineke/indent-blankline.nvim"] = {
      event = "BufRead",
      config = function()
         require("plugins.configs.others").blankline()
      end,
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      event = { "BufRead", "BufNewFile" },
      run = ":TSUpdate",
      config = function()
         require "plugins.configs.treesitter"
      end,
   },

   -- git stuff
   ["lewis6991/gitsigns.nvim"] = {
      opt = true,
      config = function()
         require("plugins.configs.others").gitsigns()
      end,
      setup = function()
         utils.packer_lazy_load "gitsigns.nvim"
      end,
   },

   -- lsp stuff

   ["williamboman/nvim-lsp-installer"] = {
      opt = true,
      setup = function()
         utils.packer_lazy_load "nvim-lsp-installer"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
   },

   ["neovim/nvim-lspconfig"] = {
      after = "nvim-lsp-installer",
      module = "lspconfig",
      config = function()
         require "plugins.configs.lsp_installer"
         require "plugins.configs.lspconfig"
      end,
   },

   ["ray-x/lsp_signature.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("plugins.configs.others").signature()
      end,
   },

   ["andymass/vim-matchup"] = {
      opt = true,
      setup = function()
         utils.packer_lazy_load "vim-matchup"
      end,
   },

   ["max397574/better-escape.nvim"] = {
      event = "InsertCharPre",
      config = function()
         require("plugins.configs.others").better_escape()
      end,
   },

   -- load luasnips + cmp related in insert mode only

   ["rafamadriz/friendly-snippets"] = {
      module = "cmp_nvim_lsp",
      event = "InsertEnter",
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "plugins.configs.cmp"
      end,
   },

   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").luasnip()
      end,
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      after = "LuaSnip",
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      after = "cmp_luasnip",
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      after = "cmp-nvim-lua",
   },

   ["hrsh7th/cmp-buffer"] = {
      after = "cmp-nvim-lsp",
   },

   ["hrsh7th/cmp-path"] = {
      after = "cmp-buffer",
   },

   -- misc plugins
   ["windwp/nvim-autopairs"] = {
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").autopairs()
      end,
   },

   ["numToStr/Comment.nvim"] = {
      module = "Comment",
      keys = { "gc", "gb" },
      config = function()
         require("plugins.configs.others").comment()
      end,
   },

   -- file managing , picker etc
   ["kyazdani42/nvim-tree.lua"] = {
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function()
         require "plugins.configs.nvimtree"
      end,
   },

   ["nvim-telescope/telescope.nvim"] = {
      cmd = "Telescope",
      config = function()
         require "plugins.configs.telescope"
      end,
   },

    ["windwp/nvim-ts-autotag"] = {
          ft = { "html", "javascriptreact" },
          after = "nvim-treesitter",
          config = function()
             require("nvim-ts-autotag").setup()
          end,
       },

     ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
           require("plugins.configs.null-ls").setup()
        end,
     },

     ["fedepujol/move.nvim"] = {},

     ["liuchengxu/vista.vim"] = {},

     ["tpope/vim-surround"] = {},

     ["tpope/vim-fugitive"] = {},

     ["ellisonleao/gruvbox.nvim"] = {},


}

plugins = utils.remove_default_plugins(plugins)

-- merge user plugin table & default plugin table
plugins = utils.plugin_list(plugins)

return packer.startup(function(use)
   for _, v in pairs(plugins) do
      use(v)
   end
end)
