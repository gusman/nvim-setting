-- Requirements
local lspconfig = require('lspconfig')
local util = lspconfig.util

lspconfig.gopls.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern( "go.work", "go.mod", ".git" ),
	single_file_support = true,
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
	single_file_support = true,
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


-- require'lspconfig'.lua_ls.setup ({})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
require('lspconfig').pylsp.setup ({
	capabilities = capabilities,
})

require('lspconfig').gopls.setup ({
	capabilities = capabilities,
})

-- require'lspconfig'.lua_ls.setup ({
-- 	capabilities = capabilities,
-- })
