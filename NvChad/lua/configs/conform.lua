local options = {
  formatters_by_ft = {
    lua = { "stylua" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		sh = { "shfmt" },
		python = { "black" },
    c = {"clang-format"},
    php = { "php_cs_fixer" },
  },
}

return options
