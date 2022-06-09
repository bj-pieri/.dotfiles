local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

   b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   --ruby
   b.formatting.rubocop,

   -- python
   b.formatting.black,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
   }
end

return M
