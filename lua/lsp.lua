-- Completion capability
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("gopls")
vim.lsp.config("gopls", {
	-- Server-specific settings. See `:help lspconfig-setup`
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	-- root_markers = { "go.work", "go.mod", ".git" },
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

vim.lsp.enable("pylsp")
vim.lsp.config("pylsp", {
    cmd = { "pylsp" },
    filetypes = { "python" },
    -- root_dir = util.root_pattern( ".git", "setup.cfg", "setup.py", "pyproject.toml" ),
	-- root_markers = { ".git", "setup.cfg", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"  },
    single_file_support = true,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    -- ignore = {'W391'},
                    maxLineLength = 88
                },
                autopep8 = { enabled = false},
                isort = {
                    enabled = true,
                    profile = "black",
                    line_length = 88,
                },
                black = { enabled = true },
                yapf = { enabled = false},
                -- jedi = {
                --     extra_paths = { 
                --        "relative_extra_path_1", 
                --        "relative_extra_path_2", 
                --        "relative_extra_path_3" 
                --     },
                --     prioritize_extra_paths = true
                -- }
            }
        }
    },
    capabilities = capabilities,
})
