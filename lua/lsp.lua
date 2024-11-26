-- Completion capability
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
	capabilities = capabilities,
})

lspconfig.pylsp.setup({
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_dir = util.root_pattern( ".git", "setup.cfg", "setup.py", "pyproject.toml" ),
    single_file_support = true,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    -- ignore = {'W391'},
                    maxLineLength = 88
                },
                autopep8 = { enabled = true },
                isort = {
                    enabled = true,
                    multi_line_output = 3,
                    line_length = 88,
                },
                black = { enabled = true },
                yapf = { enabled = true },
                -- jedi = {
                --     extra_paths = { "src/lib/cg", "src/komodo", "src/clab_util" },
                --     prioritize_extra_paths = true
                -- }
            }
        }
    },
    capabilities = capabilities,
})
