local M = {}

M.treesitter = {
   ensure_installed = {
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
      "lua",
      "norg",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },

view = {
      hide_root_folder = false,
   },
}

M.telescope = {
   extensions = {
      -- fd is needed
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
      },
   },
}

M.statusline = {
icon_styles = {
   block = {
      main_icon = "   ",
   },
}
}


return M
