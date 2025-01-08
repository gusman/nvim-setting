-- To move somewhere
-- Nvim tree configs
require("nvim-tree").setup({
	renderer = {
		indent_markers = {
			enable = true,
		},
        

		-- Enable below code block if does not want to use
		-- we devicon

		-- icons = {
		-- 	web_devicons = {
		-- 		file = {
		-- 			enable = false,
		-- 		},
		-- 		folder = {
		-- 			enable = false,
		-- 		},
		-- 	},
		-- 	git_placement = "after",
		-- 	show = {
		-- 		file = false,
		-- 		folder = true,
		-- 		folder_arrow = true,
		-- 	},
		-- 	glyphs = {
		-- 		folder = {
		-- 		  arrow_closed = "+",
		-- 		  arrow_open = "+",
		-- 		  default = "",
		-- 		  open = "",
		-- 		  empty = "",
		-- 		  empty_open = "",
		-- 		  symlink = ">",
		-- 		  symlink_open = "^",
		-- 		},
		-- 	},
		-- },

	},
	actions = {
		open_file = {
			-- quit_on_open = true,
            window_picker = {
                enable = false,
            },
		},
	},
})
