local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{ "hrsh7th/nvim-cmp", opts = overrides.cmp },

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	{
		"stevearc/conform.nvim",
    lazy = false,
		config = function()
			require("custom.configs.conform")
		end,
	},

	-- override plugin configs
	{
		"lewis6991/gitsigns.nvim",
		opts = overrides.gitsigns,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = overrides.blankline,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
    lazy = false,
	},

	{
		"matze/vim-move",
		lazy = false,
	},

	{
		"liuchengxu/vista.vim",
		lazy = false,
	},

	{
		"tpope/vim-surround",
		lazy = false,
	},

	{
		"iamcco/markdown-preview.nvim",
		lazy = false,
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		-- config = function ()
		--   require "custom.plugins.markdown-preview"
		-- end,
	},

	{
		"junegunn/fzf",
		lazy = false,
		run = function()
			vim.fn["fzf#install"]()
		end,
	},

	{
		"mg979/vim-visual-multi",
		lazy = false,
	},

	{
		"jakerobers/vim-hexrgba",
		lazy = false,
	},

	{
		"karb94/neoscroll.nvim",
		keys = { "<C-d>", "<C-u>" },
		config = function()
			require("neoscroll").setup()
		end,
	},

	{
		"andreadev-it/shade.nvim",
		config = function()
			require("shade").setup({
				exclude_filetypes = { "NvimTree" },
			})
		end,
	},

	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
    lazy = false,
	},

	{
		"barrett-ruth/live-server.nvim",
		lazy = false,
		build = "yarn global add live-server",
		config = true,
	},
}

return plugins
