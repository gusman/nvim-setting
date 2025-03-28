require('lualine').setup({
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
		lualine_a = {
			-- Show only first character
			{ 'mode', fmt = function(str) return str:sub(1,1) end } 
		},
		lualine_b = { 
			-- Maximum length of branch name is set to 40 characters
			{ 'branch', fmt = function(str) return str:sub(1,40) end },
			'diff', 
			'diagnostics'
		},
		lualine_c = { { 'filename', path = 1 }, },
		lualine_x = {
			'encoding', 
			'fileformat',
			'filetype'
		},
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
})
