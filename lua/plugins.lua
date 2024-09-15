-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- file explorer
	use 'nvim-tree/nvim-tree.lua'

	-- lsp-config
	use 'neovim/nvim-lspconfig'

	-- color scheme
	use {
	  "loctvl842/monokai-pro.nvim",
	  config = function()
		require("monokai-pro").setup()
	  end
	}
	use 'ellisonleao/gruvbox.nvim'
	use { "catppuccin/nvim", as = "catppuccin"  }
	use 'rebelot/kanagawa.nvim'

	-- commenter
	use 'numToStr/Comment.nvim'

	-- telesecope
	use { 
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.6',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- ripgrep
	-- ripgrep requires ripgres application is installed in OS level
	-- ripgrep is required by telescope for live-grep function
	use 'BurntSushi/ripgrep'

	-- treesitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

end)


