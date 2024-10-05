-- Global display and behavior
vim.o.number = true
vim.o.ruler = true
vim.o.ignorecase = true
vim.opt.backspace = "indent,eol,start"
vim.o.hlsearch = true
-- vim.o.cursorline = true

-- Color 
vim.opt.termguicolors = true

-- No wrap by default
vim.opt.wrap = false

-- Global or common editor
vim.o.ts = 4
vim.o.sw = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
	
-- Python specific editing
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	callback = function()
	vim.bo.expandtab = true
end
})



