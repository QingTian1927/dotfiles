--------------------------
-- NEOVIM CONFIGURATION --
--------------------------

vim.loader.enable()

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.loader")

-----------------------------------------
-- ENVIRONMENT-DEPENDENT CONFIGURATION --
-----------------------------------------

local os_type = vim.loop.os_uname().sysname
local term = os.getenv("TERM_PROGRAM")

if (os_type == "Windows_NT")
then
  vim.cmd("colorscheme vscode")
elseif (term == "linux" or term == "tmux")
then
  vim.cmd("colorscheme oxocarbon")
else
  vim.cmd("colorscheme adwaita")
end

