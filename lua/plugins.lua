return {
	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- lsp-config
	"neovim/nvim-lspconfig",

	-- completion
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	-- color scheme
	{ "loctvl842/monokai-pro.nvim", lazy=false, },
	"ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", name = "catppuccin"  },
	"rebelot/kanagawa.nvim",

	-- commenter
	"numToStr/Comment.nvim",

	-- telescope
	{ 
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.6',
		requires = { 
			{ 'nvim-lua/plenary.nvim' },
		}
	},

	-- telescope grep
	{ "BurntSushi/ripgrep" },

	-- telescope find files
	{ "sharkdp/fd" },


	-- telescope fzf
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', 
		build = 'make',
	},

	-- treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- git
	"lewis6991/gitsigns.nvim",

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- markdown renderer
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	}

	-- Notification
	-- lazy.nvim
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	}
	-- }

}


