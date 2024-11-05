-- NvimTree mapping
vim.keymap.set('n', '<F9>', ':NvimTreeToggle<cr>')

-- Telescope mapping
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {}) 
vim.keymap.set('n', '<leader>fo', function() builtin.lsp_document_symbols({ symbol_width = 64 }) end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics({ bufnr = 0 }) end, {})
vim.keymap.set('n', '<leader>fD', builtin.diagnostics, {})

-- LSP mapping
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = {buffer = event.buf}
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- You can find details of these function in the help page
		-- see for example, :help vim.lsp.buf.hover()

		-- Trigger code completion
		-- bufmap('i', '<C-Space>', '<C-x><C-o>')

		-- Display documentation of the symbol under the cursor
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

		-- Jump to the definition
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

		-- Jump to declaration
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

		-- Lists all the implementations for the symbol under the cursor
		bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

		-- Jumps to the definition of the type symbol
		bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

		-- Lists all the references 
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

		-- Displays a function's signature information
		bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

		-- Renames all references to the symbol under the cursor
		bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

		-- Format current file
		bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format()<cr>')

		-- Selects a code action available at the current cursor position
		bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
	end
})

-- Git mapping
require('gitsigns').setup({
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
})

-- Symbol outline toggle
vim.keymap.set("n", "<F8>", "<cmd>AerialToggle!<CR>")
