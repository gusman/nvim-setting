-- NvimTree mapping
vim.keymap.set('n', '<F9>', ':NvimTreeToggle<cr>')


-- Telescope mapping
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


