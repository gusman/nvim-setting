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
require("completion")
require("lsp")
require("notif")
require("symbol-outline")

-- Theme
require("theme")

-- Keymap
require("keymaps")

-- Autocommand
require("autocmd")


