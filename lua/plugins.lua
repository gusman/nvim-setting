return {
	-- file explorer
	"nvim-tree/nvim-tree.lua",

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
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }

}


