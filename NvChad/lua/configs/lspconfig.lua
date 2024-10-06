-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
	"html",
	"cssls",
	"ts_ls",
	"clangd",
  "gopls",
	"pyright",
	"racket_langserver",
	"bashls",
	"dockerls",
  "intelephense",
  -- "jdtls",
  -- "angularls",
  -- "volar",
	-- "tailwindcss",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
