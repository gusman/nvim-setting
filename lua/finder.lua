-- Setup telescope
local telescope = require("telescope")
telescope.setup({
	defaults = {
		layout_strategy = "vertical"
		-- other defaults configuration here
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case" default is "smart_case"
		}
	}
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
-- telescope.load_extension("noice")


