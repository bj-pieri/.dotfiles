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
		-- php = { "php_cs_fixer" },
	},
}

require("conform").setup(options)
