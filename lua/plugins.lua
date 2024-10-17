return {
	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- lsp-config
	"neovim/nvim-lspconfig",

	-- color scheme
	{ "loctvl842/monokai-pro.nvim", lazy=false, },
	"ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", name = "catppuccin"  },
	"rebelot/kanagawa.nvim",

	-- commenter
	"numToStr/Comment.nvim",

	-- telesecope
	{ 
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.6',
		requires = { { 'nvim-lua/plenary.nvim' } }
	},

	-- telescope fzf
	{ 
		'nvim-telescope/telescope-fzf-native.nvim', 
		build = 'make',
	},

	-- ripgrep
	-- ripgrep requires ripgres application is installed in OS level
	-- ripgrep is required by telescope for live-grep function
	"BurntSushi/ripgrep",

	-- treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- git
	"lewis6991/gitsigns.nvim",

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Notification
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}

}


