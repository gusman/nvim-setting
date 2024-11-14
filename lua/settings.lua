-- Global display and behavior
vim.o.number = true
vim.o.ruler = true
vim.o.ignorecase = true
vim.opt.backspace = "indent,eol,start"
vim.o.hlsearch = true
vim.o.cursorline = true

-- Color 
vim.opt.termguicolors = true

-- No wrap by default
vim.opt.wrap = false

-- Global or common editor
vim.o.ts = 4
vim.o.sw = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
	
-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Below part is required for vim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- exrc
vim.o.exrc = true



