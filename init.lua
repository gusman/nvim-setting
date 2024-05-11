require("settings")
require("plugins")
require("keymaps")
require("theme")
require("lsp")

-- Color 
vim.opt.termguicolors = true

-- Below part is required for vim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Auto format buffer with LSP
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.go',
	group = 'AutoFormatting',
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

-- To move somewhere
-- Nvim tree configs
require("nvim-tree").setup {
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			web_devicons = {
				file = {
					enable = false,
				},
				folder = {
					enable = false,
				},
			},
			git_placement = "after",
			show = {
				file = false,
				folder = true,
				folder_arrow = true,
			},
			glyphs = {
				folder = {
				  arrow_closed = "+",
				  arrow_open = "+",
				  default = "",
				  open = "",
				  empty = "",
				  empty_open = "",
				  symlink = ">",
				  symlink_open = "^",
				},
			},
		},
	},
}

-- To move somewhere
-- Comment mapping configs
require('Comment').setup({
	ignore = '^$',
	toggler = {
		line = '<leader>cc',
		block = '<leader>bc',
	},
	opleader = {
		line = '<C-_>',
		block = '<C-\\>',
	},
})


