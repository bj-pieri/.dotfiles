return {

  ["folke/which-key.nvim"] = false,

  ["manzeloth/live-server"] = {},

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = {
      git = {
        enable = true,
      },

      view = {
        hide_root_folder = false,
        adaptive_size = true,
        side = 'left',
       },
    }
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = {
        "vim",
        "javascript",
        "json",
        "markdown",
        "c",
        "bash",
        "lua",
        "ruby",
      },
    }
  },

  ["NvChad/ui"] = {
    override_options = {
    statusline = {
      separator_style = "block", -- default/round/block/arrow
      overriden_modules = nil,
     },
    }
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = {
    signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "││", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },

    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm = {
      enable = false
    },
  }
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
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },

   ["fedepujol/move.nvim"] = {},

   ["liuchengxu/vista.vim"] = {},

   ["tpope/vim-surround"] = {},

   ["tpope/vim-fugitive"] = {},

   ["iamcco/markdown-preview.nvim"] = {
     run = function() vim.fn["mkdp#util#install"]() end,
     -- config = function ()
     --   require "custom.plugins.markdown-preview"
     -- end,
   },
 }
