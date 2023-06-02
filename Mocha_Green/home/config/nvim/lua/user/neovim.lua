--------------------------
-- NEOVIM CONFIGURATION --
--------------------------

local set = vim.opt
set.number = true
set.list = true
set.listchars = {tab = "🡢 |", trail = "~" }
--set.listchars:append "eol:↴"
--set.listchars:append "space:·"

set.autoindent = true
set.smartindent = true
set.ignorecase = true
set.smartcase = true

-- Cursor highlight
set.cursorline = true
set.cursorcolumn = false
