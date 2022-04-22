
local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = { "html", "cssls", "clangd", "pyright", "gopls", "solargraph", "phpactor", "tsserver", "rust_analyzer"}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end


    cmd = { "vscode-html-language-server", "--stdio" }
    filetypes = { "html" }
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    }
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
      end
    settings = {}
    single_file_support = true


end

return M
