require("config.lazy")
require("lazy").setup("plugins")
require("settings")
require("theme")
require("lsp")
require("keymaps")

-- Below part is required for vim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Auto format buffer with LSP
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { '*.go' } ,
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

		-- Enable below code block if does not want to use
		-- we devicon

		-- icons = {
		-- 	web_devicons = {
		-- 		file = {
		-- 			enable = false,
		-- 		},
		-- 		folder = {
		-- 			enable = false,
		-- 		},
		-- 	},
		-- 	git_placement = "after",
		-- 	show = {
		-- 		file = false,
		-- 		folder = true,
		-- 		folder_arrow = true,
		-- 	},
		-- 	glyphs = {
		-- 		folder = {
		-- 		  arrow_closed = "+",
		-- 		  arrow_open = "+",
		-- 		  default = "",
		-- 		  open = "",
		-- 		  empty = "",
		-- 		  empty_open = "",
		-- 		  symlink = ">",
		-- 		  symlink_open = "^",
		-- 		},
		-- 	},
		-- },

	},
	actions = {
		open_file = {
			quit_on_open = true,
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


-- Telescope
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case" default is "smart_case"
		}
	}
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Git
require('gitsigns').setup{
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({']c', bang = true})
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({'[c', bang = true})
			else
				gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		-- map('n', '<leader>hs', gitsigns.stage_hunk)
		-- map('n', '<leader>hr', gitsigns.reset_hunk)
		-- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
		-- map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
		-- map('n', '<leader>hS', gitsigns.stage_buffer)
		-- map('n', '<leader>hu', gitsigns.undo_stage_hunk)
		-- map('n', '<leader>hR', gitsigns.reset_buffer)
		-- map('n', '<leader>hp', gitsigns.preview_hunk)
		map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
		-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
		map('n', '<leader>hd', gitsigns.diffthis)
		map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
		-- map('n', '<leader>td', gitsigns.toggle_deleted)

		-- Text object
		map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}

-- Lualine
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
			disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

-- Noice
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},

	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

-- Completion
local cmp = require'cmp'
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},

	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }), 
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
require('lspconfig').pylsp.setup {
	capabilities = capabilities,
}

require('lspconfig').golsp.setup {
	capabilities = capabilities,
}
