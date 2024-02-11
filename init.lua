require("settings")
require("plugins")
require("keymaps")
require("lsp")


-- Below part is required for vim-tree
--
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


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

-- Nvim commnet configs
require("Comment").setup()


