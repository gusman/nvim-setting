require("config.lazy")
require("lazy").setup("plugins")
require("keymaps")
require("theme")
require("lsp")

-- Color 
vim.opt.termguicolors = true

-- No wrap by default
vim.opt.wrap = false

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
		line = '<C-_>',
		block = '<C-\\>',
	},
	opleader = {
		line = '<C-_>',
		block = '<C-\\>',
	},
})

-- TreeSitter configuration
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
