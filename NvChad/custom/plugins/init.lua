return {
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
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["fedepujol/move.nvim"] = {},

   ["liuchengxu/vista.vim"] = {},

   ["tpope/vim-surround"] = {},

   ["tpope/vim-fugitive"] = {},


   }

