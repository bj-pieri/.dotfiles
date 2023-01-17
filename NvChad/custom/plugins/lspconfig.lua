local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd", "pyright", "gopls", "solargraph", "tsserver", "rust_analyzer", "bashls", "intelephense", "jdtls"}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
