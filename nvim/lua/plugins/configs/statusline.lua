local present, feline = pcall(require, "feline")

if not present then
   return
end

local gruvbox = {
   white = "#ebdbb2",
   darker_black = "#232323",
   black = "#282828", --  nvim bg
   black2 = "#2e2e2e",
   one_bg = "#353535",
   one_bg2 = "#3f3f3f",
   one_bg3 = "#444444",
   grey = "#464646",
   grey_fg = "#4e4e4e",
   grey_fg2 = "#505050",
   light_grey = "#565656",
   red = "#fb4934",
   baby_pink = "#cc241d",
   pink = "#ff75a0",
   line = "#2c2f30", -- for lines like vertsplit
   green = "#b8bb26",
   vibrant_green = "#a9b665",
   nord_blue = "#83a598",
   blue = "#458588",
   yellow = "#d79921",
   sun = "#fabd2f",
   purple = "#b4bbc8",
   dark_purple = "#d3869b",
   teal = "#749689",
   orange = "#e78a4e",
   cyan = "#82b3a8",
   statusline_bg = "#2c2c2c",
   lightbg = "#353535",
   lightbg2 = "#303030",
   pmenu_bg = "#83a598",
   folder_bg = "#83a598",
 }

 local options = {
   lsp = require "feline.providers.lsp",
   lsp_severity = vim.diagnostic.severity,
}

options.icon_styles = {
   default = {
      left = "",
      right = " ",
      main_icon = " ",
      vi_mode_icon = " ",
      position_icon = " ",
   },
   arrow = {
      left = "",
      right = "",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },

   block = {
      left = " ",
      right = " ",
      main_icon = "   ",
      vi_mode_icon = "  ",
      position_icon = "  ",
   },

   round = {
      left = "",
      right = "",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },

   slant = {
      left = " ",
      right = " ",
      main_icon = " ",
      vi_mode_icon = " ",
      position_icon = " ",
   },
}

options.separator_style = options.icon_styles.block

options.main_icon = {
   provider = options.separator_style.main_icon,

   hl = {
      fg = gruvbox.statusline_bg,
      bg = gruvbox.nord_blue,
   },

   right_sep = {
      str = options.separator_style.right,
      hl = {
         fg = gruvbox.nord_blue,
         bg = gruvbox.lightbg,
      },
   },
}

options.file_name = {
   provider = function()
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
         return icon
      end
      return " " .. icon .. " " .. filename .. " "
   end,
   hl = {
      fg = gruvbox.white,
      bg = gruvbox.lightbg,
   },

   right_sep = {
      str = options.separator_style.right,
      hl = { fg = gruvbox.lightbg, bg = gruvbox.lightbg2 },
   },
}

options.dir_name = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "  " .. dir_name .. " "
   end,

   hl = {
      fg = gruvbox.grey_fg2,
      bg = gruvbox.lightbg2,
   },
   right_sep = {
      str = options.separator_style.right,
      hi = {
         fg = gruvbox.lightbg2,
         bg = gruvbox.statusline_bg,
      },
   },
}

options.diff = {
   add = {
      provider = "git_diff_added",
      hl = {
         fg = gruvbox.grey_fg2,
         bg = gruvbox.statusline_bg,
      },
      icon = " ",
   },

   change = {
      provider = "git_diff_changed",
      hl = {
         fg = gruvbox.grey_fg2,
         bg = gruvbox.statusline_bg,
      },
      icon = "  ",
   },

   remove = {
      provider = "git_diff_removed",
      hl = {
         fg = gruvbox.grey_fg2,
         bg = gruvbox.statusline_bg,
      },
      icon = "  ",
   },
}

options.git_branch = {
   provider = "git_branch",
   hl = {
      fg = gruvbox.grey_fg2,
      bg = gruvbox.statusline_bg,
   },
   icon = "  ",
}

options.diagnostic = {
   error = {
      provider = "diagnostic_errors",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.ERROR)
      end,

      hl = { fg = gruvbox.red },
      icon = "  ",
   },

   warning = {
      provider = "diagnostic_warnings",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.WARN)
      end,
      hl = { fg = gruvbox.yellow },
      icon = "  ",
   },

   hint = {
      provider = "diagnostic_hints",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.HINT)
      end,
      hl = { fg = gruvbox.grey_fg2 },
      icon = "  ",
   },

   info = {
      provider = "diagnostic_info",
      enabled = function()
         return options.lsp.diagnostics_exist(options.lsp_severity.INFO)
      end,
      hl = { fg = gruvbox.green },
      icon = "  ",
   },
}

options.lsp_progress = {
   provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
         local msg = Lsp.message or ""
         local percentage = Lsp.percentage or 0
         local title = Lsp.title or ""
         local spinners = {
            "",
            "",
            "",
         }

         local success_icon = {
            "",
            "",
            "",
         }

         local ms = vim.loop.hrtime() / 1000000
         local frame = math.floor(ms / 120) % #spinners

         if percentage >= 70 then
            return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
         end

         return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
   end,
   hl = { fg = gruvbox.green },
}

options.lsp_icon = {
   provider = function()
      if next(vim.lsp.buf_get_clients()) ~= nil then
         return "   LSP"
      else
         return ""
      end
   end,
   hl = { fg = gruvbox.grey_fg2, bg = gruvbox.statusline_bg },
}

options.mode_colors = {
   ["n"] = { "NORMAL", gruvbox.red },
   ["no"] = { "N-PENDING", gruvbox.red },
   ["i"] = { "INSERT", gruvbox.dark_purple },
   ["ic"] = { "INSERT", gruvbox.dark_purple },
   ["t"] = { "TERMINAL", gruvbox.green },
   ["v"] = { "VISUAL", gruvbox.cyan },
   ["V"] = { "V-LINE", gruvbox.cyan },
   [""] = { "V-BLOCK", gruvbox.cyan },
   ["R"] = { "REPLACE", gruvbox.orange },
   ["Rv"] = { "V-REPLACE", gruvbox.orange },
   ["s"] = { "SELECT", gruvbox.nord_blue },
   ["S"] = { "S-LINE", gruvbox.nord_blue },
   [""] = { "S-BLOCK", gruvbox.nord_blue },
   ["c"] = { "COMMAND", gruvbox.pink },
   ["cv"] = { "COMMAND", gruvbox.pink },
   ["ce"] = { "COMMAND", gruvbox.pink },
   ["r"] = { "PROMPT", gruvbox.teal },
   ["rm"] = { "MORE", gruvbox.teal },
   ["r?"] = { "CONFIRM", gruvbox.teal },
   ["!"] = { "SHELL", gruvbox.green },
}

options.chad_mode_hl = function()
   return {
      fg = options.mode_colors[vim.fn.mode()][2],
      bg = gruvbox.one_bg,
   }
end

options.empty_space = {
   provider = " " .. options.separator_style.left,
   hl = {
      fg = gruvbox.one_bg2,
      bg = gruvbox.statusline_bg,
   },
}

-- this matches the vi mode color
options.empty_spaceColored = {
   provider = options.separator_style.left,
   hl = function()
      return {
         fg = options.mode_colors[vim.fn.mode()][2],
         bg = gruvbox.one_bg2,
      }
   end,
}

options.mode_icon = {
   provider = options.separator_style.vi_mode_icon,
   hl = function()
      return {
         fg = gruvbox.statusline_bg,
         bg = options.mode_colors[vim.fn.mode()][2],
      }
   end,
}

options.empty_space2 = {
   provider = function()
      return " " .. options.mode_colors[vim.fn.mode()][1] .. " "
   end,
   hl = options.chad_mode_hl,
}

options.separator_right = {
   provider = options.separator_style.left,
   hl = {
      fg = gruvbox.grey,
      bg = gruvbox.one_bg,
   },
}

options.separator_right2 = {
   provider = options.separator_style.left,
   hl = {
      fg = gruvbox.green,
      bg = gruvbox.grey,
   },
}

options.position_icon = {
   provider = options.separator_style.position_icon,
   hl = {
      fg = gruvbox.black,
      bg = gruvbox.green,
   },
}

options.current_line = {
   provider = function()
      local current_line = vim.fn.line "."
      local total_line = vim.fn.line "$"

      if current_line == 1 then
         return " Top "
      elseif current_line == vim.fn.line "$" then
         return " Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return " " .. result .. "%% "
   end,

   hl = {
      fg = gruvbox.green,
      bg = gruvbox.one_bg,
   },
}

local function add_table(tbl, inject)
   if inject then
      table.insert(tbl, inject)
   end
end

-- components are divided in 3 sections
options.left = {}
options.middle = {}
options.right = {}

-- left
add_table(options.left, options.main_icon)
add_table(options.left, options.file_name)
add_table(options.left, options.dir_name)
add_table(options.left, options.diff.add)
add_table(options.left, options.diff.change)
add_table(options.left, options.diff.remove)
add_table(options.left, options.diagnostic.error)
add_table(options.left, options.diagnostic.warning)
add_table(options.left, options.diagnostic.hint)
add_table(options.left, options.diagnostic.info)

add_table(options.middle, options.lsp_progress)

-- right
add_table(options.right, options.lsp_icon)
add_table(options.right, options.git_branch)
add_table(options.right, options.empty_space)
add_table(options.right, options.empty_spaceColored)
add_table(options.right, options.mode_icon)
add_table(options.right, options.empty_space2)
add_table(options.right, options.separator_right)
add_table(options.right, options.separator_right2)
add_table(options.right, options.position_icon)
add_table(options.right, options.current_line)

-- Initialize the components table
options.components = { active = {} }

options.components.active[1] = options.left
options.components.active[2] = options.middle
options.components.active[3] = options.right

options.theme = {
   bg = gruvbox.statusline_bg,
   fg = gruvbox.fg,
}

feline.setup {
   theme = options.theme,
   components = options.components,
}
