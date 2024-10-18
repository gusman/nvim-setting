-- Requirements
local lspconfig = require('lspconfig')
local util = lspconfig.util

lspconfig.gopls.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern( "go.work", "go.mod", ".git" ),
	single_file_support = false,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

require'lspconfig'.pylsp.setup{
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_dir = util.root_pattern( ".git", "setup.cfg", "setup.py", "pyproject.toml" ),
	single_file_support = false,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
--					ignore = {'W391'},
					maxLineLength = 88
				},
				black = {enabled = true},
			}
		}
	}
}


