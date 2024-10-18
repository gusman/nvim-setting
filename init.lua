-- Lazy
require("config.lazy")
require("lazy").setup("plugins")

-- Global builtin neovim setting
require("settings")

--  Plugin setup
require("file-explorer")
require("file-syntax")
require("code-comment")
require("finder")
require("git-status")
require("status-line")
require("lsp")
require("completion")
-- require("notification")

-- Theme
require("theme")

-- Keymap
require("keymaps")

-- Autocommand
require("autocmd")


