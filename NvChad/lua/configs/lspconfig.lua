-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


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
  "jdtls",
  -- "angularls",
  -- "tailwindcss",
}

vim.lsp.enable(servers)
