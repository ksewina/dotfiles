-- Organized and straightforward setup

-- Set leader keys early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configuration
require("config.core.options")
require("config.core.keymaps")
require("config.core.autocmds")

-- Load plugins
require("config.plugins")

